from api.models import UserState
import datetime
import pytz
from django.db.models import F


def handle_app_authorized(sender, request, token, **kwargs):
    del (sender, request, kwargs)
    # user_obj = User.objects.get(id=token.user)
    token.user.last_login = datetime.datetime.now(pytz.utc)
    UserState.objects.update_or_create(user=token.user, defaults={"num_of_login": F('num_of_login') + 1})
    token.user.save()
