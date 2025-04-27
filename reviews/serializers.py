from rest_framework import serializers
from .models import Review
from bookings.models import Booking
from datetime import date


class ReviewSerializer(serializers.ModelSerializer):
    author = serializers.ReadOnlyField(source='author.username')

    class Meta:
        model = Review
        fields = ['id', 'estate', 'author', 'rating', 'text', 'created_at']
        read_only_fields = ['id', 'author', 'created_at']

    def validate_rating(self, value):
        if not (1 <= value <= 5):
            raise serializers.ValidationError("Рейтинг должен быть от 1 до 5.")

        return value

    def validate(self, data):
        user = self.context['request'].user
        estate = data['estate']

        if estate.owner == user:
            raise serializers.ValidationError("Вы не можете оставить отзыв на своё собственное жильё.")

        has_booking = Booking.objects.filter(
            estate=estate,
            user=user,
            status__in=['confirmed', 'cancelled'],
            end_date__lte=date.today()
        ).exists()

        if not has_booking:
            raise serializers.ValidationError("Вы можете оставить отзыв только после завершённого бронирования.")

        return data
