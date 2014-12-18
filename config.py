from os import curdir
from os.path import abspath

SECRET_KEY = 'flask-session-insecure-secret-key'
SQLALCHEMY_DATABASE_URI = 'postgresql://webadmin:123456@localhost:5432/webtests'
SQLALCHEMY_ECHO = True
WTF_CSRF_ENABLED = False
STATISTIC_DIR = abspath(curdir + '/webtests/tmp')
IMAGES_PATH = [STATISTIC_DIR]