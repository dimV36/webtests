from os import curdir
from os.path import abspath

ADMIN_PASSWORD = '12345678'
SECRET_KEY = 'flask-session-insecure-secret-key'
SQLALCHEMY_DATABASE_URI = 'postgresql://webadmin:123456@localhost:5432/webtests'
SQLALCHEMY_ECHO = True
WTF_CSRF_ENABLED = False
USE_PASSWORD_POLICY = True
STATISTIC_DIR = abspath(curdir + '/tmp')
IMAGES_PATH = [STATISTIC_DIR]