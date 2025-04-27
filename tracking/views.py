from rest_framework import viewsets, permissions
from rest_framework.views import APIView
from rest_framework.response import Response

from estates.models import Estate
from .models import SearchQuery, ViewRecord
from .serializer import ViewRecordSerializer, SearchQuerySerializer
from django.db.models import Count


class SearchQueryViewSet(viewsets.ModelViewSet):
    serializer_class = SearchQuerySerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return SearchQuery.objects.filter(user=self.request.user)

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)


class PopularSearchesView(APIView):
    def get(self, request):
        top_queries = (
            SearchQuery.objects.values('query')
            .annotate(count=Count('id'))
            .order_by('-count')[:10]
        )
        return Response(top_queries)


class ViewRecordViewSet(viewsets.ModelViewSet):
    serializer_class = ViewRecordSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return ViewRecord.objects.filter(user=self.request.user)

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)


class PopularEstatesView(APIView):
    def get(self, request):
        estates = (
            Estate.objects.annotate(view_count=Count('views')).order_by('-view_count')[:10]
        )
        from estates.serializers import EstateSerializer
        return Response(EstateSerializer(estates, many=True).data)
