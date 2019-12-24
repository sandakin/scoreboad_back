from api.models import UserState
import datetime
import pytz
from django.db.models import F


def handle_app_authorized(sender, request, token, **kwargs):
    del (sender, request, kwargs)
    # user_obj = User.objects.get(id=token.user)
    token.user.last_login = datetime.datetime.now(pytz.utc)
    if hasattr(token.user, 'user_state'):
        state = token.user.user_state
        state.num_of_login += 1
        state.save()
    else:
        UserState.objects.create(user=token.user, num_of_login=1)
    token.user.save()
