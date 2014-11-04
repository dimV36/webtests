# coding=utf-8
__author__ = 'dimv36'
from sqlalchemy.orm.exc import NoResultFound
from models import User, InvestmentLevel
from roles import ROLE_ADMIN

__ADMIN_USER = 'admin'
__INVESTMENT_LEVELS = {u'Инвестиционный уровень 1', u'Инвестиционный уровень 2', u'Инвестиционный уровень 3'}


def create_entities():
    __create_admin()
    __create_investment_level()


def __create_admin():
    admin = None
    try:
        admin = User.query.filter(User.username == __ADMIN_USER).one()
    except NoResultFound:
        pass
    if admin is None:
        User.create(username=__ADMIN_USER, password='123456', role=ROLE_ADMIN)


def __create_investment_level():
    investment_level = None
    for level in __INVESTMENT_LEVELS:
        try:
            investment_level = InvestmentLevel.query.filter(InvestmentLevel.investment_level == level).one()
        except NoResultFound:
            pass
        if investment_level is None:
            InvestmentLevel.create(investment_level=level)