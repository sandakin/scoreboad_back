from django.contrib import admin
from api.models import (Tournament, Team, Player, PlayerScore, Game, GameScore, TeamScore, Staff)

# Register your models here.
admin.site.register(Tournament)
admin.site.register(Team)
admin.site.register(Player)
admin.site.register(PlayerScore)
admin.site.register(Game)
admin.site.register(GameScore)
admin.site.register(TeamScore)
admin.site.register(Staff)
