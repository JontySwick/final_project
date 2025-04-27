from django.db import models
from accounts.models import CustomUser
from estates.models import Estate


class Review(models.Model):
    RATING_CHOICES = [(i, i) for i in range(1, 6)]

    estate = models.ForeignKey(Estate, on_delete=models.CASCADE, related_name='reviews')
    author = models.ForeignKey(CustomUser, on_delete=models.CASCADE, related_name='reviews')
    rating = models.IntegerField(choices=RATING_CHOICES)
    text = models.TextField(blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = ('estate', 'author')

    def __str__(self):
        return f"{self.author.username} → {self.estate.title} ({self.rating}★)"
