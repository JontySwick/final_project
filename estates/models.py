from django.db import models
from accounts.models import CustomUser


class Estate(models.Model):
    TYPE_CHOICES = [
        ('apartment', 'Квартира'),
        ('house', 'Дом'),
    ]

    title = models.CharField(max_length=255)
    description = models.TextField()
    location = models.CharField(max_length=255)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    rooms = models.PositiveIntegerField()
    type = models.CharField(max_length=20, choices=TYPE_CHOICES)
    is_active = models.BooleanField(default=True)
    owner = models.ForeignKey(CustomUser, on_delete=models.CASCADE, related_name='estates')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    views = models.PositiveIntegerField(default=0)

    def __str__(self):
        return f"{self.title} — {self.location}"
