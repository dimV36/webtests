# coding=utf-8
__author__ = 'dimv36'
from sqlalchemy.orm.exc import NoResultFound
from models import User
from roles import ROLE_ADMIN

__ADMIN_USER = 'admin'


def create_admin():
    admin = None
    try:
        admin = User.query.filter(User.username == __ADMIN_USER).one()
    except NoResultFound:
        pass
    if admin is None:
        User.create(username=__ADMIN_USER, password='123456', role=ROLE_ADMIN)