# coding=utf-8
__author__ = 'dimv36'
from flask_login import AnonymousUserMixin, LoginManager
from webtests.models import User

# Модуль инициализации менеджера входа пользователей

login_manager = LoginManager()


class AnonymousUser(AnonymousUserMixin):
    id = None


login_manager.anonymous_user = AnonymousUser
login_manager.login_view = 'login'


@login_manager.user_loader
def load_user(user_id):
    return User.query.get(user_id)
