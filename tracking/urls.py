from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import SearchQueryViewSet, PopularSearchesView, PopularEstatesView

router = DefaultRouter()
router.register('history', SearchQueryViewSet, basename='search-history')

urlpatterns = [
    path('', include(router.urls)),
    path('popular/', PopularSearchesView.as_view(), name='popular-searches'),
    path('popular-estates/', PopularEstatesView.as_view(), name='popular-estates'),
]
