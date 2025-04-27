from django.db import models
from accounts.models import CustomUser
from estates.models import Estate


class SearchQuery(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE, related_name='search_queries')
    query = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-created_at']

    def __str__(self):
        return f"{self.user.username} → {self.query}"


class ViewRecord(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE, related_name='viewed_estates')
    estate = models.ForeignKey(Estate, on_delete=models.CASCADE, related_name='view_records')
    viewed_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-viewed_at']
        unique_together = ('user', 'estate', 'viewed_at')

    def __str__(self):
        return f"{self.user.username} viewed {self.estate.title} @ {self.viewed_at}"
