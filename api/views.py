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
    queryset = Team.objects.all()
    serializer_class = TeamSerializer

    def get_queryset(self):
        team_list = sorted(Team.objects.all(), key=lambda t: t.avg_score, reverse=True)
        team_list = [obj.id for obj in team_list]
        return Team.objects.filter(id__in=team_list)

    # def list(self, request, *args, **kwargs):
    #     team_list = super().list(request, args, kwargs)
    #     team_list.data = sorted(team_list.data, key=lambda k: k['avg_score'], reverse=True)
    #     return team_list


class GameScoreViewSet(viewsets.ModelViewSet):
    """ view set for manage vendor """
    queryset = GameScore.objects.all().order_by('-id')
    serializer_class = GameScoreSerializer


class GameViewSet(viewsets.ModelViewSet):
    """ view set for manage vendor """
    queryset = Game.objects.all().order_by('-id')
    serializer_class = GameSerializer
    filterset_fields = ['game_score__team_id']


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
        defaults = {"last_ping": datetime.datetime.now(pytz.utc)}
        if hasattr(request.user, 'user_state'):
            state = request.user.user_state
            if state.last_ping:
                state.tot_time_spend = state.tot_time_spend + (
                        datetime.datetime.now(pytz.utc) - state.last_ping).seconds
                state.save()
        else:
            defaults['tot_time_spend'] = (datetime.datetime.now(pytz.utc) - request.user.last_login).seconds

        UserState.objects.update_or_create(user=request.user, defaults=defaults)
        return Response({"status": 1})
