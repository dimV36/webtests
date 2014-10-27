__author__ = 'dimv36'
from os.path import abspath, dirname, join
from platform import uname

CSRF_ENABLED = True
SECRET_KEY = '123456'

basedir = abspath(dirname(__file__))
hostname = uname()[1]
SQLALCHEMY_DATABASE_URI = 'postgresql://postgres@localhost:5432/webtests'
SQLALCHEMY_MIGRATE_REPO = join(basedir, 'db_repository')
