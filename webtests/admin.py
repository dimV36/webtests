# coding=utf-8
__author__ = 'dimv36'
from sqlalchemy.orm.exc import NoResultFound

from models import User, InvestmentLevel, ApplicationData
from webtests.roles import ROLE_ADMIN


__ADMIN_USER = 'admin'
__INVESTMENT_LEVELS = [u'Инвестиционный уровень 1', u'Инвестиционный уровень 2', u'Инвестиционный уровень 3']
INVESTMENT_LEVELS = [u'Инвестиционный уровень 1', u'Инвестиционный уровень 2', u'Инвестиционный уровень 3']

HEADMASTER_START_TESTING = 'is_headmaster_start_testing'
__APPLICATION_FIELD_DATA = [HEADMASTER_START_TESTING]


def create_entities():
    __create_admin()
    __create_investment_level()
    __init_application_data()


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


def __init_application_data():
    data = None
    for field in __APPLICATION_FIELD_DATA:
        try:
            data = ApplicationData.query.filter(ApplicationData.description == field).one()
        except NoResultFound:
            pass
        if data is None:
            ApplicationData.create(description=field, status=False)


def get_application_data(field):
    try:
        app_data = ApplicationData.query.filter(ApplicationData.description == field).one()
    except NoResultFound:
        raise LookupError(u'Не найдено значение переменной %s', field)
    return app_data


def get_investment_levels():
    try:
        investment_levels = InvestmentLevel.query.all()
    except NoResultFound:
        raise LookupError(u'Не найдены значения инвестиционных уровней')
    levels = list()
    for i in range(0, len(investment_levels)):
        levels.append((i, investment_levels[i].investment_level))
    return levels