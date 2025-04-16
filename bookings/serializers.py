from rest_framework import serializers
from .models import Booking
from datetime import date
from django.db.models import Q


class BookingSerializer(serializers.ModelSerializer):
    user = serializers.ReadOnlyField(source='user.username')
    estate = serializers.HiddenField(default=None)
    estate_id = serializers.PrimaryKeyRelatedField(
        queryset=Booking._meta.get_field('estate').related_model.objects.all(),
        source='estate',
        write_only=True
    )

    class Meta:
        model = Booking
        fields = (
            'id', 'estate', 'estate_id', 'user',
            'start_date', 'end_date', 'status', 'created_at'
        )
        read_only_fields = ('status', 'created_at')

    def validate(self, data):
        start_date = data['start_date']
        end_date = data['end_date']
        estate = data['estate']
        user = self.context['request'].user

        if start_date >= end_date:
            raise serializers.ValidationError("Дата начала должна быть раньше даты окончания.")

        if start_date < date.today():
            raise serializers.ValidationError("Нельзя бронировать жильё в прошлом.")

        if estate.owner == user:
            raise serializers.ValidationError("Вы не можете бронировать своё собственное жильё.")

        overlapping_bookings = Booking.objects.filter(
            estate=estate,
            status__in=['pending', 'confirmed'],
        ).filter(
            Q(start_date__lte=end_date) & Q(end_date__gte=start_date)
        )

        if overlapping_bookings.exists():
            raise serializers.ValidationError("Выбранные даты уже заняты.")

        return data
