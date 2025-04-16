from django.db.models import When, Case, Value, IntegerField
from django.utils import timezone
from rest_framework import status
from rest_framework.mixins import CreateModelMixin, RetrieveModelMixin, UpdateModelMixin, ListModelMixin
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.viewsets import GenericViewSet

from .models import Booking
from .serializers import BookingSerializer
from .permissions import *


class BookingViewSet(CreateModelMixin,
                     RetrieveModelMixin,
                     UpdateModelMixin,
                     ListModelMixin,
                     GenericViewSet):
    serializer_class = BookingSerializer
    permission_classes = [IsAuthenticated, IsOwner]

    def get_queryset(self):
        user = self.request.user
        date_order_case = Case(
            When(start_date__gte=timezone.now().date(), then=Value(0)),
            When(start_date__lt=timezone.now().date(), then=Value(1)),
            default=Value(2),
            output_field=IntegerField(),
        )

        if user.is_landlord:
            filter = {'estate__owner': user}

            status_order_case = Case(
                When(status='pending', then=Value(0)),
                When(status='confirmed', then=Value(0)),
                default=Value(1),
                output_field=IntegerField(),
            )
        else:
            filter = {'user': user}

            status_order_case = Case(
                When(status='declined', then=Value(1)),
                When(status='cancelled', then=Value(1)),
                default=Value(0),
                output_field=IntegerField(),
            )

        return (
            Booking.objects.annotate(
                status_order=status_order_case,
                date_order=date_order_case
            )
            .filter(**filter)
            .order_by('status_order', '-date_order', 'start_date')
        )

    def perform_create(self, serializer):
        estate_id = self.request.data.get('estate_id')
        serializer.save(user=self.request.user, estate_id=estate_id)

    def update(self, request, *args, **kwargs):
        instance = self.get_object()
        if instance.user == request.user and instance.status == 'pending':
            instance.status = 'cancelled'
            instance.save()
            return Response({'status': 'cancelled'})
        elif instance.estate.owner == request.user:
            new_status = request.data.get('status')
            if new_status in ['confirmed', 'declined']:
                instance.status = new_status
                instance.save()
                return Response({'status': new_status})
        return Response({'error': 'Недостаточно прав или неверное состояние'}, status=status.HTTP_403_FORBIDDEN)
