from django.db.models import Avg, Q
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import SearchFilter, OrderingFilter
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from rest_framework.viewsets import ModelViewSet

import accounts.permissions
from .models import Estate
from .serializers import EstateSerializer
from .permissions import IsOwnerOrReadOnly
from .filters import EstateFilter
from accounts.permissions import IsLandlord


class EstateViewSet(ModelViewSet):
    serializer_class = EstateSerializer

    filter_backends = [DjangoFilterBackend, SearchFilter, OrderingFilter]
    filterset_class = EstateFilter
    search_fields = ['title', 'description']
    ordering_fields = ['price', 'created_at', 'views']
    ordering = ['-created_at']

    def get_permission_classes(self):
        permissions = [IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly]
        if self.action == 'create':
            permissions.append(IsLandlord)

        return permissions

    def get_queryset(self):
        filers = [Q(is_active=True)]
        if self.request.user.is_authenticated:
            filers.append(Q(owner=self.request.user))

        return (
            Estate.objects
            .annotate(avg_rating=Avg('reviews__rating'))
            .filter(Q(*filers, _connector=Q.OR))
        )

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.views += 1
        instance.save(update_fields=['views'])
        return super().retrieve(request, *args, **kwargs)
