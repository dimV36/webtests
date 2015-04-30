# coding=utf-8
__author__ = 'dimv36'
from os import curdir
from os.path import abspath

# Пароль администратора
ADMIN_PASSWORD = '12345678'
# Параметры подключения к базе данных
SQLALCHEMY_DATABASE_URI = 'postgresql://webadmin:123456@localhost:5432/webtests'
# Параметры, необходимые для работы приложения
SECRET_KEY = 'flask-session-insecure-secret-key'
SQLALCHEMY_ECHO = True
WTF_CSRF_ENABLED = False
# Использовать парольную политику при регистрации пользователей?
USE_PASSWORD_POLICY = True
# Путь, по которому сохраняются диаграммы
STATISTIC_DIR = abspath(curdir + '/tmp')
# Список путей, по которому Flask-Image ищет изображения
IMAGES_PATH = [STATISTIC_DIR]