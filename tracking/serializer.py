from rest_framework import serializers
from .models import SearchQuery, ViewRecord


class SearchQuerySerializer(serializers.ModelSerializer):
    class Meta:
        model = SearchQuery
        fields = ['id', 'user', 'query', 'created_at']
        read_only_fields = ['id', 'user', 'created_at']


class ViewRecordSerializer(serializers.ModelSerializer):
    class Meta:
        model = ViewRecord
        fields = ['id', 'user', 'estate', 'viewed_at']
        read_only_fields = ['id', 'user', 'viewed_at']
