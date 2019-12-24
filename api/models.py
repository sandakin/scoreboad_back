from django.db import models
from django.db.models import Avg
from django.contrib.auth.models import User


# Create your models here.


class Tournament(models.Model):
    start_date = models.DateTimeField()
    end_date = models.DateTimeField()
    no_of_games = models.IntegerField()
    sponsor = models.CharField(max_length=100)
    description = models.CharField(max_length=200)

    def __str__(self):
        return 'Tournament No: %s' % self.id


class Team(models.Model):
    name = models.CharField(max_length=45)
    logo = models.FileField()

    def __str__(self):
        return self.name

    @property
    def avg_score(self):
        try:
            avg = TeamScore.objects.filter(team=self).aggregate(Avg('total_points')).get('total_points__avg')
            return avg if avg else 0
        except Exception as e:
            print(str(e))
        return 0


class Staff(models.Model):
    name = models.CharField(max_length=45)
    type = models.CharField(max_length=20)
    team = models.ForeignKey(Team, on_delete=models.CASCADE, related_name='staff')
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='staff', null=True)


class Player(models.Model):
    name = models.CharField(max_length=45)
    rank = models.CharField(max_length=20)
    height = models.FloatField()
    dob = models.DateField()
    team = models.ForeignKey(Team, on_delete=models.CASCADE, related_name='player')
    user = models.OneToOneField(User, on_delete=models.SET_NULL, related_name='player', null=True)

    def __str__(self):
        return self.name

    @property
    def avg_score(self):
        try:
            avg = PlayerScore.objects.filter(player=self).aggregate(Avg('points')).get('points__avg')
            return avg if avg else 0
        except Exception as e:
            print(str(e))
        return 0


class Game(models.Model):
    tournament = models.ForeignKey(Tournament, on_delete=models.CASCADE, related_name='games')
    title = models.CharField(max_length=45)
    date = models.DateField()
    location = models.CharField(max_length=100)
    start_time = models.TimeField()
    end_time = models.TimeField(null=True)

    def __str__(self):
        return self.title


class PlayerScore(models.Model):
    minutes_played = models.IntegerField()
    rebounds = models.IntegerField()
    assists = models.IntegerField()
    points = models.IntegerField()
    player = models.ForeignKey(Player, on_delete=models.CASCADE, related_name='player_score')
    game = models.ForeignKey(Game, on_delete=models.CASCADE, related_name='player_score')


class GameScore(models.Model):
    game = models.ForeignKey(Game, on_delete=models.CASCADE, related_name='game_score')
    team = models.ForeignKey(Team, on_delete=models.CASCADE, related_name='game_score')
    q1 = models.IntegerField(null=True)
    q2 = models.IntegerField(null=True)
    q3 = models.IntegerField(null=True)
    q4 = models.IntegerField(null=True)
    is_win = models.BooleanField()


class TeamScore(models.Model):
    total_field_goals = models.IntegerField()
    success_field_goals = models.IntegerField()
    total_points = models.IntegerField()
    success_points = models.IntegerField()
    total_free_throws = models.IntegerField()
    success_free_throws = models.IntegerField()
    rebounds = models.IntegerField()
    offensive = models.IntegerField()
    assists = models.IntegerField()
    blocks = models.IntegerField()
    steals = models.IntegerField()
    turnovers = models.IntegerField()
    points_in_the_paint = models.IntegerField()
    fouls_personal = models.IntegerField()
    team = models.ForeignKey(Team, on_delete=models.CASCADE, related_name='team_score')
    game = models.ForeignKey(Game, on_delete=models.CASCADE, related_name='team_score')


class UserState(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='user_state')
    last_ping = models.DateTimeField(null=True)
    num_of_login = models.IntegerField(default=0)
    tot_time_spend = models.IntegerField(default=0)
