from .base import *

secrets = json.loads(open(SECRET_DEV, 'rt').read())

DEBUG = True
ALLOWED_HOSTS = []
DATABASES = secrets['DATABASES']
WSGI_APPLICATION = 'config.wsgi.dev.application'

# Media(User-upload files)를 위한 스토리지
DEFAULT_FILE_STORAGE = 'config.storage.DefaultFilesStorage'
# static files(collectstatic)를 위한 스토리지
STATICFILES_STORAGE = 'config.storage.StaticFilesStorage'
