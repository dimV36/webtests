from random import SystemRandom

from backports.pbkdf2 import pbkdf2_hmac, compare_digest
from flask_login import UserMixin
from sqlalchemy.ext.hybrid import hybrid_property

from webtests.data import CRUDMixin, db


class User(UserMixin, CRUDMixin, db.Model):
    __tablename__ = 'users'
    username = db.Column(db.String(50), unique=True)
    role = db.Column(db.String(50))
    _password = db.Column(db.LargeBinary(120))
    _salt = db.Column(db.String(120))
#    sites = db.relationship('Site', backref='owner', lazy='dynamic')

    @hybrid_property
    def password(self):
        return self._password

    # In order to ensure that passwords are always stored
    # hashed and salted in our database we use a descriptor
    # here which will automatically hash our password
    # when we provide it (i. e. user.password = "12345")
    @password.setter
    def password(self, value):
        # When a user is first created, give them a salt
        if self._salt is None:
            self._salt = bytes(SystemRandom().getrandbits(128))
        self._password = self._hash_password(value)

    def is_valid_password(self, password):
        """Ensure that the provided password is valid.

        We are using this instead of a ``sqlalchemy.types.TypeDecorator``
        (which would let us write ``User.password == password`` and have the incoming
        ``password`` be automatically hashed in a SQLAlchemy query)
        because ``compare_digest`` properly compares **all***
        the characters of the hash even when they do not match in order to
        avoid timing oracle side-channel attacks."""
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

    def __repr__(self):
        return '<InvestmentLevel #{:d}>'.format(self.id)

    def __unicode__(self):
        return unicode('id: %i, name: %s, process_id: %i' % (self.id, self.name.data, self.process.id))


class Process(CRUDMixin, db.Model):
    __tablename__ = 'process'
    name = db.Column(db.String(120), unique=True)
    role = db.Column(db.String(120))
    investment_level_id = db.Column(db.Integer, db.ForeignKey('investment_level.id'))
    questionnaire_id = db.relationship('Question', backref='questionnaire', lazy='dynamic')

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


class ApplicationData(CRUDMixin, db.Model):
    __tablename__ = 'application_data'
    description = db.Column(db.String(120), unique=True)
    status = db.Column(db.Boolean)


class UsersChoices(CRUDMixin, db.Model):
    __tablename__ = 'users_choices'
    username = db.Column(db.String(120))
    description = db.Column(db.String(120))
    variant = db.Column(db.Integer)