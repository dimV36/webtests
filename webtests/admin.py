# coding=utf-8
__author__ = 'dimv36'
from sqlalchemy.orm.exc import NoResultFound

from models import User, InvestmentLevel, ApplicationData, UsersChoices, Process, Question
from webtests.roles import ROLE_ADMIN, ROLES_FOR_TESTING
from random import randint


__ADMIN_USER = 'admin'
__INVESTMENT_LEVELS = [u'Инвестиционный уровень ' + str(i) for i in range(1, 6)]
__QUESTIONS = [u'Вопрос 1', u'Вопрос 2', u'Вопрос 3']
__ANSWERS = [u'Ответ 1', u'Ответ 2', u'Ответ 3', u'Ответ 4']


HEADMASTER_START_TESTING = 'is_headmaster_start_testing'
CSO_CHOOSE_PROCESSES = 'is_cso_choose_processes'
GM_ANSWERED_ON_QUESTIONS = 'is_gm_answered_on_questions'
__APPLICATION_FIELD_DATA = [HEADMASTER_START_TESTING, CSO_CHOOSE_PROCESSES, GM_ANSWERED_ON_QUESTIONS]


def create_entities():
    __create_admin()
    __create_investment_level()
    __create_processes()
    __create_questionnaire()
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


def __init_application_data():
    data = None
    for field in __APPLICATION_FIELD_DATA:
        try:
            data = ApplicationData.query.filter(ApplicationData.description == field).one()
        except NoResultFound:
            pass
        if data is None:
            ApplicationData.create(description=field, status=False)


def reset_application_data():
    for field in __APPLICATION_FIELD_DATA:
        try:
            data = ApplicationData.query.filter(ApplicationData.description == field).one()
        except NoResultFound:
            raise LookupError(u'Не найдены значения данных приложения')
        if data is not None:
            data.status = False
            data.update()


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
        levels.append((i, investment_levels[i].name))
    return levels


def get_organization_processes():
    try:
        organization_processes = Process.query.all()
    except NoResultFound:
        raise LookupError(u'Не найдены значения процессов организации')
    processes = list()
    for i in range(0, len(organization_processes)):
        processes.append((i, organization_processes[i].name))
    return processes