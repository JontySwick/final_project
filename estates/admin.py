from django.contrib import admin
from .models import Estate

@admin.register(Estate)
class EstateAdmin(admin.ModelAdmin):
    list_display = ('title', 'location', 'price', 'type', 'owner', 'is_active', 'created_at')
    list_filter = ('type', 'location', 'is_active')
    search_fields = ('title', 'description', 'location')
