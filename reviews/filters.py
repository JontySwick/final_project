from django_filters import rest_framework as filters
from .models import Estate


class EstateFilter(filters.FilterSet):
    min_price = filters.NumberFilter(field_name='price', lookup_expr='gte')
    max_price = filters.NumberFilter(field_name='price', lookup_expr='lte')
    min_rooms = filters.NumberFilter(field_name='rooms', lookup_expr='gte')
    max_rooms = filters.NumberFilter(field_name='rooms', lookup_expr='lte')
    location = filters.CharFilter(field_name='location', lookup_expr='icontains')
    type = filters.CharFilter(field_name='type', lookup_expr='exact')

    class Meta:
        model = Estate
        fields = ['location', 'price', 'rooms', 'type']
