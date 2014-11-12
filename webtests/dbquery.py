# coding=utf-8
__author__ = 'dimv36'

from sqlalchemy.orm.exc import NoResultFound, MultipleResultsFound
from models import UsersChoices, InvestmentLevel, Process, Question


def user_choice(description):
    try:
        user_choice = UsersChoices.query.filter(UsersChoices.description == description).one()
    except NoResultFound:
        raise LookupError(u'Не найден выбор пользователя')
    return user_choice


def investment_levels():
    try:
        investment_levels = InvestmentLevel.query.all()
    except NoResultFound:
        raise LookupError(u'Не найдены значения инвестиционных уровней')
    return investment_levels


def organization_processes():
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


def questions(number):
    try:
        process = UsersChoices.query.filter(UsersChoices.description == 'processes')[number]
    except NoResultFound:
        raise LookupError(u'Не найден выбор процессов пользователя')
    try:
        questions = Question.query.filter(Question.process_id == process.id).all()
    except NoResultFound:
        raise LookupError(u'Не найдены вопросы для анкеты')
    return questions


# def questionnaires():
#     questionnaires = list()
#     try:
#         processes = UsersChoices.query.filter(UsersChoices.description == 'processes').all()
#     except NoResultFound:
#         raise LookupError(u'Не найден выбор процессов пользователя')
#     for process in processes:
#         try:
#             questionnaire = Questionnaire.query.filter(Questionnaire.process_id == process.id).all()
#         except NoResultFound:
#             raise LookupError(u'Не найдены анкеты по выбранному процессу')
#         else:
#             questionnaires.append(questionnaire)
#     return questionnaires