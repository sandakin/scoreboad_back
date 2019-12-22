from django.contrib.auth.models import User
import datetime
import pytz


def handle_app_authorized(sender, request, token, **kwargs):
    del (sender, request, kwargs)
    # user_obj = User.objects.get(id=token.user)
    token.user.last_login = datetime.datetime.now(pytz.utc)
    token.user.save()
