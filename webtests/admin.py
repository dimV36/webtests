# coding=utf-8
__author__ = 'dimv36'
from sqlalchemy.orm.exc import NoResultFound

from models import User, InvestmentLevel, ApplicationData, UsersChoices, Process, Questionnaire
from webtests.roles import ROLE_ADMIN


__ADMIN_USER = 'admin'
__INVESTMENT_LEVELS = [u'Инвестиционный уровень 1', u'Инвестиционный уровень 2', u'Инвестиционный уровень 3']
__PROCESSES = [u'Процесс 1', u'Процесс 2', u'Процесс 3']
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
    process = None
    investment_level = None
    for i in range(0, len(__PROCESSES)):
        try:
            investment_level = InvestmentLevel.query.filter(
                InvestmentLevel.name == __INVESTMENT_LEVELS[i]
            ).one()
            process = Process.query.filter(Process.name == __PROCESSES[i]).one()
        except NoResultFound:
            pass
        if process is None and investment_level is not None:
            Process.create(name=__PROCESSES[i], investment_level_id=investment_level.id)


def __create_questionnaire():
    process = None
    questionnaire = None
    for i in range(0, len(__QUESTIONS)):
        try:
            process = Process.query.filter(Process.name == __PROCESSES[i]).one()
            questionnaire = Questionnaire.query.filter(Questionnaire.question == __QUESTIONS[i]).one()
        except NoResultFound:
            pass
        if questionnaire is None:
            Questionnaire.create(question=__QUESTIONS[i], answer1=__ANSWERS[0], answer2=__ANSWERS[1],
                                 answer3=__ANSWERS[2], answer4=__ANSWERS[3], process_id=process.id)


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


def get_user_choice(description):
    try:
        user_choice = UsersChoices.query.filter(UsersChoices.description == description).one()
    except NoResultFound:
        raise LookupError(u'Не найден выбор пользователя')
    return user_choice


def get_organization_processes():
    try:
        organization_processes = Process.query.all()
    except NoResultFound:
        raise LookupError(u'Не найдены значения процессов организации')
    processes = list()
    for i in range(0, len(organization_processes)):
        processes.append((i, organization_processes[i].name))
    return processes