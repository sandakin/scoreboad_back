from django.shortcuts import render
from rest_framework import viewsets
from django.contrib.auth.models import User
from api.models import (Tournament, Team, Player, PlayerScore, Game, GameScore, TeamScore, Staff)
from api.serializers import (GameSerializer, TournamentSerializer, TeamSerializer, GameScoreSerializer, StaffSerializer,
                             TeamScoreSerializer, PlayerSerializer, UserSerializer, PlayerScoreSerializer)


# Create your views here.


class UserViewSet(viewsets.ModelViewSet):
    """ view set for manage vendor """
    queryset = User.objects.exclude(is_superuser=True).order_by('-id')
    serializer_class = UserSerializer


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
