from django.shortcuts import render
from rest_framework import viewsets
from rest_framework.views import APIView
from rest_framework.response import Response
from django.contrib.auth.models import User
from rest_framework import permissions
from api.models import (Tournament, Team, Player, PlayerScore, Game, GameScore, TeamScore, Staff, UserState)
from api.serializers import (GameSerializer, TournamentSerializer, TeamSerializer, GameScoreSerializer, StaffSerializer,
                             TeamScoreSerializer, PlayerSerializer, UserSerializer, PlayerScoreSerializer)
import datetime
import pytz

# Create your views here.


class CurrentUserViewSet(viewsets.ModelViewSet):
    """ view set for manage vendor """
    permission_classes = [permissions.IsAuthenticated]
    queryset = User.objects.all().order_by('-id')
    serializer_class = UserSerializer

    def get_queryset(self):
        return User.objects.filter(id=self.request.user.id)


class UserViewSet(viewsets.ModelViewSet):
    """ view set for manage vendor """
    permission_classes = [permissions.IsAuthenticated]
    queryset = User.objects.all().order_by('-id')
    serializer_class = UserSerializer

    def get_queryset(self):
        return User.objects.exclude(id=self.request.user.id)


class TournamentViewSet(viewsets.ModelViewSet):
    """ view set for manage vendor """
    queryset = Tournament.objects.all().order_by('-id')
    serializer_class = TournamentSerializer


class TeamViewSet(viewsets.ModelViewSet):
    """ view set for manage vendor """
    queryset = Team.objects.all().order_by('-id')
    serializer_class = TeamSerializer


class GameScoreViewSet(viewsets.ModelViewSet):
    """ view set for manage vendor """
    queryset = GameScore.objects.all().order_by('-id')
    serializer_class = GameScoreSerializer


class GameViewSet(viewsets.ModelViewSet):
    """ view set for manage vendor """
    queryset = Game.objects.all().order_by('-id')
    serializer_class = GameSerializer


class TeamScoreViewSet(viewsets.ModelViewSet):
    """ view set for manage vendor """
    queryset = TeamScore.objects.all().order_by('-id')
    serializer_class = TeamScoreSerializer


class PlayerViewSet(viewsets.ModelViewSet):
    """ view set for manage vendor """
    queryset = Player.objects.all().order_by('-id')
    serializer_class = PlayerSerializer
    filterset_fields = ['team']


class PlayerScoreViewSet(viewsets.ModelViewSet):
    """ view set for manage vendor """
    queryset = PlayerScore.objects.all().order_by('-id')
    serializer_class = PlayerScoreSerializer


class StaffViewSet(viewsets.ModelViewSet):
    """ view set for manage vendor """
    queryset = Staff.objects.all().order_by('-id')
    serializer_class = StaffSerializer


class KeepUserOnlineViewSet(APIView):
    permission_classes = [permissions.IsAuthenticated]

    @staticmethod
    def get(request):
        UserState.objects.update_or_create(user=request.user, defaults={"last_ping": datetime.datetime.now(pytz.utc)})
        return Response({"status": 1})
