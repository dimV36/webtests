# coding=utf-8
__author__ = 'dimv36'
from flask import Flask

from auth import login_manager
from data import db, images
from models import create_entities

# Инициализация приложения
app = Flask(__name__)
app.config.from_object('config')

# Связь приложения с базой данных
db.init_app(app)
db.app = app

# Связь приложения с модулем динамической загрузки изображений
images.init_app(app)
images.app = app

# Инициализация менеджера входа
login_manager.init_app(app)

# Создание структур таблиц
db.create_all(app=app)
# Наполнение таблиц минимально необходимыми данными
create_entities()

from webtests import views, models