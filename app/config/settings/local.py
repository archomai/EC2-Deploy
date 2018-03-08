from .base import *

secrets = json.loads(open(SECRET_LOCAL, 'rt').read())

DEBUG = True
ALLOWED_HOSTS = []
DATABASES = secrets['DATABASES']
WSGI_APPLICATION = 'config.wsgi.local.application'
