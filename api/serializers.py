from rest_framework import serializers
from django.contrib.auth.models import User
from api.models import (Tournament, Team, Player, PlayerScore, Game, GameScore, TeamScore, Staff)
from django.db.models import Sum, Avg
import datetime
import pytz


def is_online(last_ping):
    try:
        return 120 > (datetime.datetime.now(pytz.utc) - last_ping).seconds
    except Exception as e:
        print(str(e))
    return False


class UserSerializer(serializers.ModelSerializer):
    is_online = serializers.SerializerMethodField()
    user_type = serializers.SerializerMethodField()
    team = serializers.SerializerMethodField()
    num_of_login = serializers.SerializerMethodField()
    tot_time_spend = serializers.SerializerMethodField()

    class Meta:
        model = User
        # fields = '__all__'
        exclude = ('password', 'is_superuser', 'is_staff', 'groups', 'user_permissions', 'is_active')

    @staticmethod
    def get_is_online(obj):
        if hasattr(obj, 'user_state'):
            return is_online(obj.user_state.last_ping)
        return False

    @staticmethod
    def get_user_type(obj):
        if obj.is_superuser:
            return "admin"
        if hasattr(obj, 'player'):
            return "player"
        return "staff"

    @staticmethod
    def get_team(obj):
        try:
            if hasattr(obj, 'staff'):
                return TeamSerializer(obj.staff.team).data
            if hasattr(obj, 'player'):
                return TeamSerializer(obj.player.team).data
        except Exception as e:
            print(str(e))

    @staticmethod
    def get_num_of_login(obj):
        if hasattr(obj, 'user_state'):
            return obj.user_state.num_of_login
        return 0

    @staticmethod
    def get_tot_time_spend(obj):
        if hasattr(obj, 'user_state'):
            return obj.user_state.tot_time_spend
        return 0


def user_validation(user):
    errors = {'user': None}
    if not user:
        return
    
    if user.is_superuser:
        errors['user'] = "Can't assign admin user"

    elif hasattr(user, 'player'):
        errors['user'] = "Link with other player"

    elif hasattr(user, 'staff'):
        errors['user'] = "Link with staff user"

    if errors['user']:
        raise serializers.ValidationError(errors)


class StaffSerializer(serializers.ModelSerializer):
    class Meta:
        model = Staff
        fields = '__all__'

    def validate(self, attrs):
        user_validation(attrs['user'])
        return super().validate(attrs)


class TournamentSerializer(serializers.ModelSerializer):
    games = serializers.SerializerMethodField()

    class Meta:
        model = Tournament
        fields = '__all__'

    @staticmethod
    def get_games(obj):
        return GameSerializer(obj.games.all(), many=True).data


class TeamSerializer(serializers.ModelSerializer):
    avg_score = serializers.FloatField()
    best_score = serializers.SerializerMethodField()
    num_of_win = serializers.SerializerMethodField()
    num_of_lost = serializers.SerializerMethodField()

    class Meta:
        model = Team
        fields = '__all__'

    @staticmethod
    def get_best_score(obj):
        team_score = TeamScore.objects.filter(team=obj).order_by('total_points').last()
        return team_score.total_points if team_score else None

    @staticmethod
    def get_num_of_win(obj):
        return GameScore.objects.filter(team=obj, is_win=True).count()

    @staticmethod
    def get_num_of_lost(obj):
        return GameScore.objects.filter(team=obj, is_win=False).count()


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

    def validate(self, attrs):
        user_validation(attrs['user'])
        return super().validate(attrs)


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
