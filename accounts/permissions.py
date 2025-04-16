from rest_framework import permissions
from rest_framework.permissions import BasePermission


class IsLandlord(BasePermission):
    def has_permission(self, request, view):
        return request.user and request.user.is_authenticated and request.user.is_landlord


class IsRenter(BasePermission):
    def has_permission(self, request, view):
        return request.user and request.user.is_authenticated and request.user.is_renter


class IsNotAuthenticated(BasePermission):
    message = "Вы уже авторизованы."

    def has_permission(self, request, view):
        return not request.user or not request.user.is_authenticated
