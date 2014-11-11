# coding=utf-8
__author__ = 'dimv36'

from sqlalchemy.orm.exc import NoResultFound, MultipleResultsFound
from models import UsersChoices, InvestmentLevel, Process


def get_user_choice(description):
    try:
        user_choice = UsersChoices.query.filter(UsersChoices.description == description).one()
    except NoResultFound:
        raise LookupError(u'Не найден выбор пользователя')
    return user_choice


def get_investment_levels():
    try:
        investment_levels = InvestmentLevel.query.all()
    except NoResultFound:
        raise LookupError(u'Не найдены значения инвестиционных уровней')
    return investment_levels


def get_organization_processes():
    try:
        chosen_investment_level = UsersChoices.query.filter(UsersChoices.description == 'investment_level').one()
    except NoResultFound:
        raise LookupError(u'Не найдено значение investment_level')
    except MultipleResultsFound:
        raise LookupError(u'Найдено несколько значений investment_level')
    try:
        processes = Process.query.filter(Process.investment_level_id == chosen_investment_level.variant).all()
    except NoResultFound:
        raise LookupError(u'Не найдены значения процессов')
    return processes