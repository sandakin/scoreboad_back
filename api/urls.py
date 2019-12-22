from django.conf.urls import url, include
from rest_framework import routers
from rest_framework.urlpatterns import format_suffix_patterns
from api.views import (GameViewSet, TournamentViewSet, TeamViewSet, GameScoreViewSet, TeamScoreViewSet, PlayerViewSet,
                       UserViewSet, PlayerScoreViewSet, StaffViewSet)

router = routers.SimpleRouter(trailing_slash=False)
router.register(r'game', GameViewSet)
router.register(r'tournament', TournamentViewSet)
router.register(r'team', TeamViewSet)
router.register(r'score', GameScoreViewSet)
router.register(r'team_score', TeamScoreViewSet)
router.register(r'player', PlayerViewSet)
router.register(r'user', UserViewSet)
router.register(r'player_score', PlayerScoreViewSet)
router.register(r'staff', StaffViewSet)

urlpatterns = [
    url(r'', include(router.urls)),
]

urlpatterns = format_suffix_patterns(urlpatterns)
