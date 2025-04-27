from rest_framework import serializers
from .models import Estate


class EstateSerializer(serializers.ModelSerializer):
    owner = serializers.ReadOnlyField(source='owner.username')
    avg_rating = serializers.FloatField(read_only=True)

    class Meta:
        model = Estate
        fields = '__all__'
        read_only_fields = ('id', 'owner', 'created_at', 'updated_at', 'views')
