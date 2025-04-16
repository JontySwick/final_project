from django.contrib import admin
from .models import Review


@admin.register(Review)
class ReviewAdmin(admin.ModelAdmin):
    list_display = ('estate', 'author', 'rating', 'created_at')
    list_filter = ('rating', 'created_at')
    search_fields = ('text',)
