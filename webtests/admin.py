# coding=utf-8
__author__ = 'dimv36'
from sqlalchemy.orm.exc import NoResultFound

from models import User, InvestmentLevel, ApplicationData, Process, Question
from webtests.roles import ROLE_ADMIN, ROLES_FOR_TESTING
from random import randint


__ADMIN_USER = 'admin'
__INVESTMENT_LEVELS = [u'Инвестиционный уровень ' + str(i) for i in range(1, 6)]
__QUESTIONS = [u'Вопрос 1', u'Вопрос 2', u'Вопрос 3']
__ANSWERS = [u'Ответ 1', u'Ответ 2', u'Ответ 3', u'Ответ 4']


def create_entities():
    __create_admin()
    __create_investment_level()
    __create_processes()
    __create_questionnaire()
    ApplicationData.init_application_data()


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
            investment_level = InvestmentLevel.query.filter(InvestmentLevel.name == level).one()
        except NoResultFound:
            pass
        if investment_level is None:
            InvestmentLevel.create(name=level)


def __create_processes():
    processes = None
    try:
        investment_levels = InvestmentLevel.query.all()
    except NoResultFound:
        raise LookupError(u'Не найдены значения инвестиционных уровней')
    try:
        processes = Process.query.all()
    except NoResultFound:
        pass
    if len(processes) == 0:
        for i in range(1, len(__INVESTMENT_LEVELS)):
            investment_level = investment_levels[i - 1]
            for j in range(1, 3):
                process_name = u'Процесс ' + str(i) + '.' + str(j)
                role = ROLES_FOR_TESTING[randint(0, len(ROLES_FOR_TESTING) - 1)]
                Process.create(name=process_name, investment_level_id=investment_level.id, role=role)


def __create_questionnaire():
    questionnaires = None
    try:
        processes = Process.query.all()
    except NoResultFound:
        raise LookupError(u'Не найдены значения процессов')
    try:
        questionnaires = Question.query.all()
    except NoResultFound:
        pass
    if len(questionnaires) == 0:
        for i in range(1, len(processes)):
            process = processes[i - 1]
            for j in range(1, 5):
                question = u'Вопрос ' + str(i) + '.' + str(j)
                Question.create(name=question, answer1=u'Ответ 1', answer2=u'Ответ 2',
                                     answer3=u'Ответ 3', answer4=u'Ответ 4', process_id=process.id)