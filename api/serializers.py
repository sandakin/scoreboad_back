from rest_framework import serializers
from django.contrib.auth.models import User
from api.models import (Tournament, Team, Player, PlayerScore, Game, GameScore, TeamScore, Staff)
from django.db.models import Sum, Avg


class UserSerializer(serializers.ModelSerializer):

    class Meta:
        model = User
        fields = '__all__'


class StaffSerializer(serializers.ModelSerializer):

    class Meta:
        model = Staff
        fields = '__all__'


class TournamentSerializer(serializers.ModelSerializer):

    class Meta:
        model = Tournament
        fields = '__all__'


class TeamSerializer(serializers.ModelSerializer):

    class Meta:
        model = Team
        fields = '__all__'


class PlayerSerializer(serializers.ModelSerializer):
    no_of_game = serializers.SerializerMethodField()
    tot_min = serializers.SerializerMethodField()
    tot_rebounds = serializers.SerializerMethodField()
    tot_assists = serializers.SerializerMethodField()
    tot_point = serializers.SerializerMethodField()
    avg_score = serializers.SerializerMethodField()

    class Meta:
        model = Player
        fields = '__all__'

    @staticmethod
    def get_no_of_game(obj):
        return PlayerScore.objects.filter(player=obj).count()

    @staticmethod
    def get_tot_min(obj):
        return PlayerScore.objects.filter(player=obj).aggregate(Sum('minutes_played')).get('minutes_played__sum')

    @staticmethod
    def get_tot_rebounds(obj):
        return PlayerScore.objects.filter(player=obj).aggregate(Sum('rebounds')).get('rebounds__sum')

    @staticmethod
    def get_tot_assists(obj):
        return PlayerScore.objects.filter(player=obj).aggregate(Sum('assists')).get('assists__sum')

    @staticmethod
    def get_tot_point(obj):
        return PlayerScore.objects.filter(player=obj).aggregate(Sum('points')).get('points__sum')

    @staticmethod
    def get_avg_score(obj):
        return PlayerScore.objects.filter(player=obj).aggregate(Avg('points')).get('points__avg')


class PlayerScoreSerializer(serializers.ModelSerializer):

    class Meta:
        model = PlayerScore
        fields = '__all__'


class GameScoreSerializer(serializers.ModelSerializer):
    team_details = serializers.SerializerMethodField()

    class Meta:
        model = GameScore
        fields = '__all__'

    @staticmethod
    def get_team_details(obj):
        return TeamSerializer(obj.team).data


class GameSerializer(serializers.ModelSerializer):
    # scores = serializers.RelatedField(source='game_score', read_only=True)
    scores = serializers.SerializerMethodField()

    class Meta:
        model = Game
        fields = '__all__'

    @staticmethod
    def get_scores(obj):
        return GameScoreSerializer(obj.game_score.all(), many=True).data


class TeamScoreSerializer(serializers.ModelSerializer):

    class Meta:
        model = TeamScore
        fields = '__all__'


