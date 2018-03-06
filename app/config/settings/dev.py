from .base import *

secrets = json.loads(open(SECRET_DEV, 'rt').read())

DEBUG = True
ALLOWED_HOSTS = []
DATABASES = secrets['DATABASES']
