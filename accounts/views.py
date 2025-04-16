from rest_framework import status
from rest_framework.generics import CreateAPIView, RetrieveAPIView
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework_simplejwt.views import TokenObtainPairView

from .permissions import IsNotAuthenticated
from .serializers import UserRegisterSerializer, UserSerializer
from .models import CustomUser


class RegisterView(CreateAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = UserRegisterSerializer
    permission_classes = [IsNotAuthenticated]


class ProfileView(RetrieveAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = UserSerializer
    permission_classes = [IsAuthenticated]

    def get_object(self):
        return self.request.user


class LoginView(TokenObtainPairView):
    serializer_class = TokenObtainPairSerializer
    permission_classes = [IsNotAuthenticated]

    def post(self, request, *args, **kwargs):
        response = super().post(request, *args, **kwargs)
        data = response.data

        access_token = data.get("access")
        refresh_token = data.get("refresh")

        if access_token and refresh_token:
            response.set_cookie(
                key="access_token",
                value=access_token,
                httponly=True,
                secure=False,
            )
            response.set_cookie(
                key="refresh_token",
                value=refresh_token,
                httponly=True,
                secure=False,
            )

        return response


class LogoutView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        refresh_token = request.COOKIES.get('refresh_token')
        if refresh_token:
            try:
                token = RefreshToken(refresh_token)
                token.blacklist()
                response = Response({"message": "Вы успешно вышли из аккаунта."}, status=status.HTTP_205_RESET_CONTENT)
                response.delete_cookie('access_token')
                response.delete_cookie('refresh_token')

                return response
            except Exception as e:
                return Response({"error": "Произошла ошибка при выходе из аккаунта."},
                                status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response({"error": "Refresh токен не предоставлен."}, status=status.HTTP_400_BAD_REQUEST)
