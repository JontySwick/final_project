from django.contrib import admin
from .models import SearchQuery, ViewRecord


@admin.register(SearchQuery)
class SearchQueryAdmin(admin.ModelAdmin):
    list_display = ('user', 'query', 'created_at')
    search_fields = ('query', 'user__username')
    list_filter = ('created_at',)


@admin.register(ViewRecord)
class ViewRecordAdmin(admin.ModelAdmin):
    list_display = ('user', 'estate', 'viewed_at')
    list_filter = ('viewed_at',)
    search_fields = ('user__username', 'estate__title')
