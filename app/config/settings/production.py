from .base import *

secrets = json.loads(open(SECRET_PRODUCTION, 'rt').read())

DEBUG = False
ALLOWED_HOSTS = [
    '.amazonaws.com',
]
DATABASES = secrets['DATABASES']
WSGI_APPLICATION = 'config.wsgi.production.application'

# Media(User-upload files)를 위한 스토리지
DEFAULT_FILE_STORAGE = 'storages.backends.s3boto3.S3Boto3Storage'
# static files(collectstatic)를 위한 스토리지
STATICFILES_STORAGE = 'storages.backends.s3boto3.S3Boto3Storage'
