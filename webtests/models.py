# coding=utf-8
__author__ = 'dimv36'
from random import SystemRandom
from backports.pbkdf2 import pbkdf2_hmac, compare_digest
from flask_login import UserMixin
from sqlalchemy.ext.hybrid import hybrid_property
from sqlalchemy.orm.exc import NoResultFound
from sqlalchemy.dialects.postgresql import ARRAY
from webtests.data import CRUDMixin, db
from roles import USER_ROLES, ROLE_ADMIN
from config import ADMIN_PASSWORD


class Role(UserMixin, CRUDMixin, db.Model):
    __tablename__ = 'roles'
    name = db.Column(db.String(50), unique=True)
    user = db.relationship('User', backref='role', uselist=False)
    process = db.relationship('Process', backref='role', lazy='dynamic')

    @staticmethod
    def create_roles(roles_list):
        for role in roles_list:
            try:
                Role.role_by_name(role).one()
            except NoResultFound:
                Role.create(name=role)

    @staticmethod
    def role_by_id(role_id):
        return Role.query.filter(Role.id == role_id)

    @staticmethod
    def role_by_name(role_name):
        return Role.query.filter(Role.name == role_name)

    @staticmethod
    def testing_roles():
        return Role.query.filter(Role.id >= 3)

    def __repr__(self):
        return '<Role #{:d}>'.format(self.id)


class User(UserMixin, CRUDMixin, db.Model):
    __tablename__ = 'users'
    __ADMIN_USER = 'admin'
    username = db.Column(db.String(50), unique=True)
    role_id = db.Column(db.Integer, db.ForeignKey('roles.id'))
    _password = db.Column(db.LargeBinary(120))
    _salt = db.Column(db.String(120))
    user_choice = db.relationship('UserChoice', backref='user', lazy='dynamic')

    @hybrid_property
    def password(self):
        return self._password

    @password.setter
    def password(self, value):
        # When a user is first created, give them a salt
        if self._salt is None:
            self._salt = bytes(SystemRandom().getrandbits(128))
        self._password = self._hash_password(value)

    def is_valid_password(self, password):
        new_hash = self._hash_password(password)
        return compare_digest(new_hash, self._password)

    def _hash_password(self, password):
        pwd = password.encode('utf-8')
        salt = bytes(self._salt)
        buff = pbkdf2_hmac('sha512', pwd, salt, iterations=100000)
        return bytes(buff)

    @staticmethod
    def create_admin():
        admin = None
        try:
            admin = User.query.filter(User.username == User.__ADMIN_USER).one()
        except NoResultFound:
            pass
        if admin is None:
            role = Role.role_by_name(ROLE_ADMIN).one()
            User.create(username=User.__ADMIN_USER, password=ADMIN_PASSWORD, role_id=role.id)

    @staticmethod
    def user_by_name(username):
        return User.query.filter(User.username == username)

    @staticmethod
    def user_by_role_id(role_id):
        return User.query.filter(User.role_id == role_id)

    @staticmethod
    def user_by_id(user_id):
        return User.query.filter(User.id == user_id)

    @staticmethod
    def users():
        return User.query.filter(User.username != User.__ADMIN_USER)

    @staticmethod
    def is_admin(username):
        return User.__ADMIN_USER == username

    def __repr__(self):
        return '<User #{:d}>'.format(self.id)


class InvestmentLevel(CRUDMixin, db.Model):
    __tablename__ = 'investment_levels'
    name = db.Column(db.String(120), unique=True)

    @staticmethod
    def investment_levels():
        return InvestmentLevel.query

    @staticmethod
    def investment_level(investment_level_id):
        return InvestmentLevel.query.filter(InvestmentLevel.id == investment_level_id)

    def __repr__(self):
        return '<InvestmentLevel #{:d}>'.format(self.id)


class Process(CRUDMixin, db.Model):
    __tablename__ = 'processes'
    name = db.Column(db.String(120), unique=True)
    is_important = db.Column(db.Boolean, default=False)
    role_id = db.Column(db.Integer, db.ForeignKey('roles.id'))
    questionnaire_id = db.relationship('Question', backref='questionnaire', lazy='dynamic')

    @staticmethod
    def process_by_id(process_id):
        return Process.query.filter(Process.id == process_id)

    @staticmethod
    def processes_by_role(role_id):
        return Process.query.filter(Process.role_id == role_id)

    @staticmethod
    def testing_processes(role_id, is_important):
        chosen_processes_names = [process.answer for process in UserChoice.user_choice_processes().all()]
        return Process.query.filter(Process.role_id == role_id).\
            filter(Process.is_important == is_important).\
            filter(Process.name.in_(chosen_processes_names))


    @staticmethod
    def processes():
        return Process.query

    def __repr__(self):
        return '<Process #{:d}>'.format(self.id)


class Question(CRUDMixin, db.Model):
    __tablename__ = 'questions'
    name = db.Column(db.Text)
    variants = db.Column(ARRAY(db.Text))
    correct_answer = db.Column(db.Integer)
    metric = db.Column(db.String(120))
    process_id = db.Column(db.Integer, db.ForeignKey('processes.id'))

    @staticmethod
    def question(name, process_id):
        return Question.query.filter(Question.name == name).filter(Question.process_id == process_id)

    @staticmethod
    def chosen_questions(process_id):
        return Question.query.filter(Question.process_id == process_id)

    def question_variants(self):
        result = []
        for i in range(0, len(self.variants)):
            result.append((i + 1, self.variants[i].decode('utf-8')))
        return result

    def question_answer(self, choice):
        return self.variants[choice - 1]

    def __repr__(self):
        return '<Question #{:d}>'.format(self.id)


class ApplicationData(CRUDMixin, db.Model):
    __HEADMASTER_START_TESTING = 'is_headmaster_started_testing'
    __CSO_CHOOSE_PROCESSES = 'is_cso_choose_processes'
    __CIO_ANSWERED_ON_QUESTIONS = 'is_cio_answered_on_questions'
    __OM_ANSWERED_ON_QUESTIONS = 'is_om_answered_on_questions'
    __TM_ANSWERED_ON_QUESTIONS = 'is_tm_answered_on_questions'
    __CSO_ANSWERED_ON_QUESTIONS = 'is_cso_answered_on_questions'
    __APPLICATION_FIELD_DATA = [__HEADMASTER_START_TESTING,
                                __CSO_CHOOSE_PROCESSES,
                                __CIO_ANSWERED_ON_QUESTIONS,
                                __OM_ANSWERED_ON_QUESTIONS,
                                __TM_ANSWERED_ON_QUESTIONS,
                                __CSO_ANSWERED_ON_QUESTIONS]
    __tablename__ = 'application_data'
    description = db.Column(db.String(120), unique=True)
    status = db.Column(db.Boolean)

    @staticmethod
    def __application_data(description):
        return ApplicationData.query.filter(ApplicationData.description == description)

    @staticmethod
    def reset_application_data():
        for field in ApplicationData.__APPLICATION_FIELD_DATA:
            try:
                data = ApplicationData.query.filter(ApplicationData.description == field).one()
            except NoResultFound:
                raise LookupError(u'Не найдены значения данных приложения')
            if data is not None:
                data.status = False
                data.update()

    @staticmethod
    def is_headmaster_started_testing():
        return ApplicationData.__application_data(ApplicationData.__HEADMASTER_START_TESTING).one()

    @staticmethod
    def is_cso_choose_processes():
        return ApplicationData.__application_data(ApplicationData.__CSO_CHOOSE_PROCESSES).one()

    @staticmethod
    def is_cio_answered_on_questions():
        return ApplicationData.__application_data(ApplicationData.__CIO_ANSWERED_ON_QUESTIONS).one()

    @staticmethod
    def is_om_answered_on_questions():
        return ApplicationData.__application_data(ApplicationData.__OM_ANSWERED_ON_QUESTIONS).one()

    @staticmethod
    def is_tm_answered_on_questions():
        return ApplicationData.__application_data(ApplicationData.__TM_ANSWERED_ON_QUESTIONS).one()

    @staticmethod
    def is_cso_answered_on_questions():
        return ApplicationData.__application_data(ApplicationData.__CSO_ANSWERED_ON_QUESTIONS).one()

    @staticmethod
    def init_application_data():
        for field in ApplicationData.__APPLICATION_FIELD_DATA:
            try:
                ApplicationData.query.filter(ApplicationData.description == field).one()
            except NoResultFound:
                ApplicationData.create(description=field, status=False)

    def __repr__(self):
        return 'ApplicationData #{:d}>'.format(self.id)


class UserChoice(CRUDMixin, db.Model):
    __tablename__ = 'user_choices'
    __FIELD_INVESTMENT_LEVEL = 'investment_level'
    __FIELD_PROCESS = 'process'
    __FIELD_QUESTION = 'question'
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'))
    field = db.Column(db.String(120))
    question = db.Column(db.Text)
    choice = db.Column(db.Integer)
    answer = db.Column(db.Text)

    @staticmethod
    def __user_choice(field):
        return UserChoice.query.filter(UserChoice.field == field)

    @staticmethod
    def create_investment_level_choice(username, choice, answer):
        try:
            user = User.user_by_name(username)
        except NoResultFound:
            raise ValueError(u'Не найдена запить в базе данных для пользователя "%s"' % username)
        UserChoice.create(user_id=user.one().id,
                            field=UserChoice.__FIELD_INVESTMENT_LEVEL,
                            question=u'Инвестиционный уровень',
                            choice=choice,
                            answer=answer)

    @staticmethod
    def create_process_choice(username, choice, answer):
        try:
            user = User.user_by_name(username)
        except NoResultFound:
            raise ValueError(u'Не найдена запись в базе данных для пользователя "%s"' % username)
        UserChoice.create(user_id=user.one().id,
                            field=UserChoice.__FIELD_PROCESS,
                            question=u'Процесс',
                            choice=choice,
                            answer=answer)

    @staticmethod
    def create_question_choice(username, process_id, question, choice, answer):
        try:
            user = User.user_by_name(username)
        except NoResultFound:
            raise ValueError(u'Не найдена запись в базе данных для пользователя "%s"' % username)
        UserChoice.create(user_id=user.one().id,
                            field=UserChoice.__FIELD_QUESTION + ' %d' % process_id,
                            question=question,
                            choice=choice,
                            answer=answer)

    @staticmethod
    def user_choice_chosen_investment_level():
        return UserChoice.query.filter(UserChoice.field == UserChoice.__FIELD_INVESTMENT_LEVEL)

    @staticmethod
    def user_choice_question(question_name):
        return UserChoice.query.filter(UserChoice.question == question_name)

    @staticmethod
    def user_choice_question_by_user_id(user_id):
        return UserChoice.question.filter(UserChoice.field == UserChoice.__FIELD_QUESTION).filter(UserChoice.user_id == user_id)

    @staticmethod
    def user_choice_processes():
        return UserChoice.query.filter(UserChoice.field == UserChoice.__FIELD_PROCESS)

    @staticmethod
    def user_choice_processes_by_role(user_role):
        role = Role.role_by_name(user_role).one()
        user_processes_names = [process.name for process in role.process.all()]
        return UserChoice.query.filter(UserChoice.answer.in_(user_processes_names))

    def __repr__(self):
        return '<UsersChoices #{:d}>'.format(self.id)


def create_entities():
    Role.create_roles(USER_ROLES)
    User.create_admin()
    ApplicationData.init_application_data()

