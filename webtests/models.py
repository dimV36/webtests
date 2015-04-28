# coding=utf-8
__author__ = 'dimv36'
from random import SystemRandom
from backports.pbkdf2 import pbkdf2_hmac, compare_digest
from flask_login import UserMixin
from sqlalchemy.ext.hybrid import hybrid_property
from sqlalchemy.orm.exc import NoResultFound
from sqlalchemy.dialects.postgresql import ARRAY, ENUM, JSON
from webtests.data import CRUDMixin, db
from roles import USER_ROLES, ROLE_ADMIN
from config import ADMIN_PASSWORD


class Role(UserMixin, CRUDMixin, db.Model):
    """
    Класс предсталяет собой таблицу 'roles' следующего вида:
    id          oid         идентификатор роли
    name        text        имя роли
    """
    __tablename__ = 'roles'
    name = db.Column(db.Text, unique=True)
    user = db.relationship('User', backref='role', uselist=False)
    process = db.relationship('Process', backref='role', lazy='dynamic')

    @staticmethod
    def create_roles(roles_list):
        """
        Метод создания ролей
        @:param roles_list: список ролей (list)
        """
        for role in roles_list:
            try:
                Role.role_by_name(role).one()
            except NoResultFound:
                Role.create(name=role)

    @staticmethod
    def role_by_id(role_id):
        """
        Метод получения роли по переданному идентификтору.
        Эквивалентно запросу SELECT * FROM roles WHERE id = <role_id>;
        @:param role_id: Идентификатор роли (int)
        @:return Role
        """
        return Role.query.filter(Role.id == role_id)

    @staticmethod
    def role_by_name(role_name):
        """
        Метод получения роли по переданному имени.
        Эквивалентно запросу SELECT * FROM roles WHERE name = <role_name>;
        @:param role_name: Имя роли (str)
        @:return Role
        """
        return Role.query.filter(Role.name == role_name)

    @staticmethod
    def testing_roles():
        """
        Метод получения списка тестируемых ролей.
        Предполагается, что роли ADMIN и HEADMASTER имеют идентификаторы 1 и 2 соответственно
        и они не участвуют в тестировании.
        Эквивалентно запросу SELECT * FROM roles WHERE id >= 3;
        """
        return Role.query.filter(Role.id >= 3)

    def __repr__(self):
        return '<Role #{:d}>'.format(self.id)


class User(UserMixin, CRUDMixin, db.Model):
    """
    Класс представляет собой таблицу 'users' следующего вида
    id          oid             Идентификатор пользователя
    username    text            Имя пользователя
    role_id     oid             Идентификатор роли, которой соответствует пользователь.
                                (Один к одному: одна роль к одному пользователю)
    _password   bytea           Хэш пароля пользователя
    _salt       varchar         Соль, используемая для шифрования и дешифрования пароля
    """
    __tablename__ = 'users'
    __ADMIN_USER = 'admin'
    username = db.Column(db.Text, unique=True)
    role_id = db.Column(db.Integer, db.ForeignKey('roles.id'))
    _password = db.Column(db.LargeBinary(120))
    _salt = db.Column(db.String(120))
    user_choice = db.relationship('UserChoice', backref='user', lazy='dynamic')

    @hybrid_property
    def password(self):
        """
        Метод получения пароля пользователя
        """
        return self._password

    @password.setter
    def password(self, value):
        """
        Метод установки пароля
        @:param value: пароль пользователя в текстовом виде
        """
        # Когда пользователь впервые создан, генерируем ему соль
        if self._salt is None:
            self._salt = bytes(SystemRandom().getrandbits(128))
        # Хэшируем пароль с использованием соли
        self._password = self._hash_password(value)

    def is_valid_password(self, password):
        """
        Метод проверки корректности введенного пароля
        """
        new_hash = self._hash_password(password)
        # Сравниваем хэши введённого пароля и того, которых хранится в таблице
        return compare_digest(new_hash, self._password)

    def _hash_password(self, password):
        """
        Метод шифрования пароля
        """
        pwd = password.encode('utf-8')
        salt = bytes(self._salt)
        buff = pbkdf2_hmac('sha512', pwd, salt, iterations=100000)
        return bytes(buff)

    @staticmethod
    def create_admin():
        """
        Метод создания администратора
        """
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
        """
        Метод получения пользователя по его имени.
        Эквивалентно запросу SELECT * FROM users WHERE username = <username>;
        :param username: Имя пользователя (str)
        :return BaseQuery
        """
        return User.query.filter(User.username == username)

    @staticmethod
    def user_by_role_id(role_id):
        """
        Метод получения пользователя по идентификатору роли
        Эквивалентно запросу SELECT * FROM users WHERE role_id = <role_id>;
        :param role_id: Идентификатор роли (int)
        :return BaseQuery
        """
        return User.query.filter(User.role_id == role_id)

    @staticmethod
    def user_by_id(user_id):
        """
        Метод получения пользователя по идентификатору пользователя
        Эквивалентно запросу SELECT * FROM users WHERE id = <user_id>;
        :param user_id: Идентификатор пользователя (int)
        :return BaseQuery
        """
        return User.query.filter(User.id == user_id)

    @staticmethod
    def users():
        """
        Метод получения всех пользователей системы.
        Эквивалентно запросу SELECT * FROM users WHERE username != admin;
        :return BaseQuery
        """
        return User.query.filter(User.username != User.__ADMIN_USER)

    @staticmethod
    def is_admin(username):
        """
        Пользователь является администратором?
        :param username: имя пользователя (str)
        :return bool
        """
        return User.__ADMIN_USER == username

    def __repr__(self):
        return '<User #{:d}>'.format(self.id)


class InvestmentLevel(CRUDMixin, db.Model):
    """
    Класс представляет собой таблицу 'investment_levels' следующего вида:
    id          oid         Идентификатор инвестиционного уровня
    name        text        Имя инвестиционного уровня
    """
    __tablename__ = 'investment_levels'
    name = db.Column(db.Text, unique=True)

    @staticmethod
    def investment_levels():
        """
        Метод получения инвестиционного уровней.
        Эквивалент запросу SELECT * FROM investment_levels;
        :return BaseQuery
        """
        return InvestmentLevel.query

    @staticmethod
    def investment_level(investment_level_id):
        """
        Метод получения инвестиционного уровня по идентификатору.
        Эквивалентно запросу: SELECT * FROM investment_levels WHERE id = <investment_level_id>;
        :param investment_level_id идентификатор инвестиционного уровня (int)
        :return BaseQuery
        """
        return InvestmentLevel.query.filter(InvestmentLevel.id == investment_level_id)

    def __repr__(self):
        return '<InvestmentLevel #{:d}>'.format(self.id)


class Process(CRUDMixin, db.Model):
    """
    Класс представляет таблицу 'processes' в БД следующего вида:
    id          oid     Идентификатор процесса.
    name        text    Имя процесса.
    role_id     oid     Идентификатор роли, которой принадлежит процесс
                        (связь 1 ко многим: 1 роль - несколько процессов)
    """
    __tablename__ = 'processes'
    name = db.Column(db.Text, unique=True)
    role_id = db.Column(db.Integer, db.ForeignKey('roles.id'))
    questionnaire_id = db.relationship('Question', backref='questionnaire', lazy='dynamic')

    @staticmethod
    def process_by_id(process_id):
        """
        Получить процесс по идентификатору процесса.
        Эквивалентно запросу SELECT * FROM processes WHERE id = <process_id>;
        @:param process_id: идентификатор процесса(int)
        @:return: Process
        """
        return Process.query.filter(Process.id == process_id).one()

    @staticmethod
    def processes_by_role(role_id):
        """
        Получить все процессы, приналежащие роли.
        Экивалентно запросу SELECT * FROM processes WHERE role_id = <role_id>;
        @:param role_id: идентификатор роли (int)
        @:return: BaseQuery
        """
        return Process.query.filter(Process.role_id == role_id)

    @staticmethod
    def testing_processes(role_id):
        """
        Получить список все тестируемые (выбранные пользователем CSO) процессы, принадлежащие роли.
        Эквивалентно запросу SELECT * FROM processes WHERE role_id = <role_id> AND processes.name IN (SELECT
        """
        chosen_processes_names = [process.answer for process in UserChoice.user_choice_processes().all()]
        return Process.query.filter(Process.role_id == role_id).\
            filter(Process.name.in_(chosen_processes_names))

    @staticmethod
    def processes():
        """
        Получить список кортежей (id, name) для процессов.
        @:return: List
        """
        return [(process.id, process.name) for process in Process.query.all()]

    def __repr__(self):
        return '<Process #{:d}>'.format(self.id)


class Question(CRUDMixin, db.Model):
    """
    Класс представляет таблицу 'questions' в БД следующего вида:
    id                  oid     Идентификатор вопроса.
    name                text    Имя вопроса.
    variants            text[]  Предлагаемые варианты ответа.
    marks               int[]   Оценки, которые получает пользователь за выбор варианта ответа (может быть NULL).
    correct_answers     int[]   Правильные варианты ответа (может быть NULL).
    weight              int     Вес ответа
    process_id          oid     Идентификатор процесса, которому принадлежит вопрос.
    """
    __tablename__ = 'questions'
    name = db.Column(db.Text)
    variants = db.Column(ARRAY(db.Text))
    marks = db.Column(ARRAY(db.Integer))
    correct_answers = db.Column(ARRAY(db.Integer))
    weight = db.Column(db.Integer)
    process_id = db.Column(db.Integer, db.ForeignKey('processes.id'))

    @staticmethod
    def question(name, process_id):
        """
        Получить вопрос по имени и идентификатору процесса.
        Эквивалентно запросу SELECT * FROM questions WHERE name = <question_name> AND process_id = <process_id>;
        :param name: имя вопроса (str)
        :param process_id: идентификатор процесса (int)
        :return: Question
        """
        return Question.query.filter(Question.name == name).filter(Question.process_id == process_id)

    @staticmethod
    def chosen_questions(process_id):
        """
        Получить список вопросов по значению идентификтаора процесса.
        Эквивалентно запросу SELECT * FROM questions WHERE process_id = <process_id>;
        :param process_id: идентификатор процесса (int)
        :return: list
        """
        return Question.query.filter(Question.process_id == process_id)

    def question_variants(self, create_empty_variant=True):
        """
        Получить список вариантов ответов вопроса.
        :return: list
        """
        result = []
        if create_empty_variant:
            result = [(0, '')]
        for i in range(0, len(self.variants)):
            result.append((i + 1, self.variants[i]))
        return result

    def question_answer(self, choice):
        """
        Получить вариант ответа по его номеру
        :param choice: номер ответа (int)
        :return: str
        """
        return self.variants[choice - 1]

    def question_mark(self, choice):
        """
        Получить оценку для ответа на вопрос по его номеру
        :param choice: номер ответа (int)
        :return: float
        """
        if self.marks is not None:
            return self.marks[choice - 1] / float(self.marks[0])
        else:
            return None

    def __repr__(self):
        return '<Question #{:d}>'.format(self.id)


class ApplicationData(CRUDMixin, db.Model):
    """
    Вспомогательный класс, который представляет собой таблицу 'application_data',
    с помощью которой определяется состояние информационной системы (степень прохождения пользователями тестов)
    id              oid         Идентификатор состояния
    description     text        Описание состояния
    status          boolean     True, если состояние достигнуто и False, иначе
    """
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
    description = db.Column(db.Text, unique=True)
    status = db.Column(db.Boolean)

    @staticmethod
    def __application_data(description):
        """
        Вспомогательный метод, получающий Состояние информационной системы по переданному описанию.
        Эквивалентно запросу SELECT * FROM application_data WHERE description == <description>;
        :param description: Имя состояния
        :return: ApplicationData
        """
        return ApplicationData.query.filter(ApplicationData.description == description)

    @staticmethod
    def reset_application_data():
        """
        Метод сбрасывания всех настроек системы (используется для перезапуска системы).
        Эквивалентно запросу UPDATE application_data SET status = false WHERE status = true;
        :return: None
        """
        for field in ApplicationData.__APPLICATION_FIELD_DATA:
            try:
                data = ApplicationData.query.filter(ApplicationData.description == field).one()
            except NoResultFound:
                raise LookupError(u'Не найдены значения данных приложения')
            if data is not None:
                data.status = False
                data.update()

    # Методы получения статуса прохождения пользователями тестов
    # @return: ApplicationData
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
        """
        Метод инициализации состояний системы. Используется при старте системы.
        Эквивалентно созданию 6 состояний (см. выше) со значениями False.
        :return: None
        """
        for field in ApplicationData.__APPLICATION_FIELD_DATA:
            try:
                ApplicationData.query.filter(ApplicationData.description == field).one()
            except NoResultFound:
                ApplicationData.create(description=field, status=False)

    def __repr__(self):
        return 'ApplicationData #{:d}>'.format(self.id)


class UserChoice(CRUDMixin, db.Model):
    """
    Класс представляет собой таблицу user_choices следующего вида:
    id          oid             Идентификатор
    user_id     oid             Идентификатор пользователя, занёсший запись в таблицу
    type        type_choice     Тип записи, может принимать следующие значения:
                                'investment_level', 'process', 'question'
    answer      json            Данные о выборе пользователя
    """
    __tablename__ = 'user_choices'
    __TYPE_INVESTMENT_LEVEL = 'investment_level'
    __TYPE_PROCESS = 'process'
    __TYPE_QUESTION = 'question'
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'))
    type = db.Column(ENUM(__TYPE_INVESTMENT_LEVEL, __TYPE_PROCESS, __TYPE_QUESTION, name='choice_enum'))
    answer = db.Column(JSON())

    @staticmethod
    def create_investment_level_choice(user_id, choice):
        """
        Создать запись о выборе инвестиционного уровня пользователем
        :param user_id: идентификатор пользователя (int)
        :param choice: выбор пользователя (dict)
        :return: None
        """
        investment_level_name = InvestmentLevel.investment_level(choice).one().name
        user_choice = {'choice': choice,
                       'choice_name': investment_level_name
                       }
        UserChoice.create(user_id=user_id,
                          type=UserChoice.__TYPE_INVESTMENT_LEVEL,
                          answer=user_choice)

    @staticmethod
    def create_process_choice(user_id, choices):
        """
        Создать запись о выборе процессов пользователем
        :param user_id: идентификатор пользователя (int)
        :param choices: выбор пользователя (dict)
        :return: None
        """
        process_names = []
        for choice in choices:
            process_names.append(Process.process_by_id(choice).name)
        user_choice = {'choice': choices,
                       'choice_name': process_names}
        UserChoice.create(user_id=user_id,
                          type=UserChoice.__TYPE_PROCESS,
                          answer=user_choice)

    @staticmethod
    def create_question_choice(user_id, choice):
        """
        Создать запись об ответе на вопрос пользователем
        :param user_id: идентификатор пользователя (int)
        :param choice: выбор пользователя (dict)
        :return: None
        """
        UserChoice.create(user_id=user_id,
                          type=UserChoice.__TYPE_QUESTION,
                          answer=choice)

    def choice_name(self):
        """
        Получить ответ (в текстовом виде)
        :return: str
        """
        return self.answer['choice_name']

    def choice(self):
        """
        Получить ответ (в числовом виде, как номер ответа в форме пользователя)
        :return: int
        """
        return self.answer['choice']

    def choice_process_id(self):
        """
        Получить идентификатор процесса, ответ на вопрос которого содержится в базе
        :return: int
        """
        if self.type == self.__TYPE_QUESTION:
            return self.answer['process_id']
        else:
            raise ValueError(u'Попытка получить значение процесса для объекта ответа типа %s' % self.type)

    @staticmethod
    def user_choice_chosen_investment_level():
        """
        Получить выбор пользователя инвестиционного уровня.
        :return: BaseQuery
        """
        return UserChoice.query.filter(UserChoice.type == UserChoice.__TYPE_INVESTMENT_LEVEL)

    @staticmethod
    def user_choice_questions():
        """
        Получить выбор пользователей вопросов.
        :return BaseQuery
        """
        return UserChoice.query.filter(UserChoice.type == UserChoice.__TYPE_QUESTION)

    @staticmethod
    def user_choice_processes():
        """
        Получить выбор пользователя CSO процессов для тестирования.
        :return: UserChoice
        """
        return UserChoice.query.filter(UserChoice.type == UserChoice.__TYPE_PROCESS)

    @staticmethod
    def user_choice_processes_by_role_id(role_id):
        """
        Получить процессы, по которым пользователь должен пройти тестирование
        :param role_id: идентификатор роли
        :return: BaseQuery
        """
        # Получаем выбранные процессы
        chosen_processes = UserChoice.user_choice_processes().one().choice()
        # Фильтрем процессы по роли и идентификатору процесса
        return Process.processes_by_role(role_id).filter(Process.id.in_(chosen_processes))

    @staticmethod
    def user_choice_questions_by_process_id(process_id):
        """
        Получить ответы пользователя по процессу
        :param process_id: идентификатор процесса
        :return: List
        """
        result = []
        questions = UserChoice.user_choice_questions().all()
        for question in questions:
            if question.choice_process_id() == process_id:
                result.append(question)
        return result

    def __repr__(self):
        return '<UsersChoices #{:d}>'.format(self.id)


def create_entities():
    """
    Функция инициализации приложения
    :return: None
    """
    # Создаём роли
    Role.create_roles(USER_ROLES)
    # Создаём администратора
    User.create_admin()
    # Создаём параметры системы
    ApplicationData.init_application_data()
