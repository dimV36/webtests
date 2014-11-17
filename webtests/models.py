# coding=utf-8
__author__ = 'dimv36'
from random import SystemRandom
from backports.pbkdf2 import pbkdf2_hmac, compare_digest
from flask_login import UserMixin
from sqlalchemy.ext.hybrid import hybrid_property
from sqlalchemy.orm.exc import NoResultFound, MultipleResultsFound
from webtests.data import CRUDMixin, db


class User(UserMixin, CRUDMixin, db.Model):
    __tablename__ = 'users'
    username = db.Column(db.String(50), unique=True)
    role = db.Column(db.String(50))
    _password = db.Column(db.LargeBinary(120))
    _salt = db.Column(db.String(120))
    # sites = db.relationship('Site', backref='owner', lazy='dynamic')

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

    def __repr__(self):
        return '<User #{:d}>'.format(self.id)


class InvestmentLevel(CRUDMixin, db.Model):
    __tablename__ = 'investment_level'
    name = db.Column(db.String(120), unique=True)
    process = db.relationship('Process', backref='investment_level', lazy='dynamic')

    def investment_levels(self):
        return self.query

    def __repr__(self):
        return '<InvestmentLevel #{:d}>'.format(self.id)


class Process(CRUDMixin, db.Model):
    __tablename__ = 'process'
    name = db.Column(db.String(120), unique=True)
    role = db.Column(db.String(120))
    investment_level_id = db.Column(db.Integer, db.ForeignKey('investment_level.id'))
    questionnaire_id = db.relationship('Question', backref='questionnaire', lazy='dynamic')

    @staticmethod
    def process(process_id):
        return Process.query.filter(Process.id == process_id).one()

    @staticmethod
    def chosen_processes():
        try:
            chosen_investment_level = UsersChoices.user_choice('investment_level').one()
        except NoResultFound:
            raise LookupError(u'Не найдено значение investment_level')
        except MultipleResultsFound:
            raise LookupError(u'Найдено несколько значений investment_level')
        return Process.query.filter(Process.investment_level_id == chosen_investment_level.variant)

    def __repr__(self):
        return '<Process #{:d}>'.format(self.id)


class Question(CRUDMixin, db.Model):
    __tablename__ = 'questions'
    name = db.Column(db.Text, unique=True)
    answer1 = db.Column(db.Text)
    answer2 = db.Column(db.Text)
    answer3 = db.Column(db.Text)
    answer4 = db.Column(db.Text)
    process_id = db.Column(db.Integer, db.ForeignKey('process.id'))

    @staticmethod
    def chosen_questions(process_id):
        return Question.query.filter(Question.process_id == process_id)

    def question_variants(self):
        return [(1, self.answer1), (2, self.answer2),
                (3, self.answer3), (4, self.answer4)]

    def __repr__(self):
        return '<Question #{:d}>'.format(self.id)


class ApplicationData(CRUDMixin, db.Model):
    __HEADMASTER_START_TESTING = 'is_headmaster_start_testing'
    __CSO_CHOOSE_PROCESSES = 'is_cso_choose_processes'
    __GM_ANSWERED_ON_QUESTIONS = 'is_gm_answered_on_questions'
    __APPLICATION_FIELD_DATA = [__HEADMASTER_START_TESTING, __CSO_CHOOSE_PROCESSES, __GM_ANSWERED_ON_QUESTIONS]
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
    def headmaster_is_start_testing():
        return ApplicationData.__application_data(ApplicationData.__HEADMASTER_START_TESTING)

    @staticmethod
    def cso_choose_processes():
        return ApplicationData.__application_data(ApplicationData.__CSO_CHOOSE_PROCESSES)

    @staticmethod
    def gm_answered_on_questions():
        return ApplicationData.__application_data(ApplicationData.__GM_ANSWERED_ON_QUESTIONS)

    @staticmethod
    def init_application_data():
        data = None
        for field in ApplicationData.__APPLICATION_FIELD_DATA:
            try:
                data = ApplicationData.query.filter(ApplicationData.description == field)
            except NoResultFound:
                pass
            if data is None:
                ApplicationData.create(description=field, status=False)

    def __repr__(self):
        return 'ApplicationData #{:d}>'.format(self.id)


class UsersChoices(CRUDMixin, db.Model):
    __tablename__ = 'users_choices'
    username = db.Column(db.String(120))
    description = db.Column(db.String(120))
    variant = db.Column(db.Integer)

    @staticmethod
    def user_choice(description):
        return UsersChoices.query.filter(UsersChoices.description == description)

    def __repr__(self):
        return '<UsersChoices #{:d}>'.format(self.id)