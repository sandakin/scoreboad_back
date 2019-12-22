"""
WSGI config for scoreboard_back project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/3.0/howto/deployment/wsgi/
"""

import os
import sys

from django.core.wsgi import get_wsgi_application

sys.path.append('/var/www/scoreboad_back')
# adjust the Python version in the line below as needed
sys.path.append('/var/www/scoreboad_back/venv/lib/python3.6/site-packages')

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'scoreboard_back.settings')

application = get_wsgi_application()
