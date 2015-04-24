# coding=utf-8
from flask_wtf import Form
from sqlalchemy.orm.exc import MultipleResultsFound, NoResultFound
from wtforms import fields, widgets
from webtests.validators.validators import MyInputRequired
from wtforms.validators import ValidationError
from models import Role, User, UserChoice, InvestmentLevel, Process, ApplicationData
from roles import ROLES
from config import USE_PASSWORD_POLICY


class _MultiCheckboxField(fields.SelectMultipleField):
    """
    Вспомогательный виджет MultiCheckBox, необходимый для отрисовки вопросов
    """
    widget = widgets.TableWidget()
    option_widget = widgets.CheckboxInput()


class HeadmasterForm(Form):
    investment_levels = fields.RadioField(coerce=int, default=None)

    def __init__(self, *args, **kwargs):
        """
        Метод инициализации формы HeadMasterForm
        :param args: список неупорядочных параметров (list)
        :param kwargs: список упорядочных параметров (dict)
        :return: self
        """
        super(self.__class__, self).__init__(*args, **kwargs)
        self.investment_levels.choices = [(level.id, level.name) for level in InvestmentLevel.investment_levels()]
        # Устанавливаем ранее созданные правильные ответы
        if ApplicationData.is_headmaster_started_testing().status:
            self.investment_levels.process_data(UserChoice.user_choice_chosen_investment_level().one().choice())


class CSOForm(Form):
    processes = _MultiCheckboxField(coerce=int, default=0, choices=Process.processes())

    def validate_processes(self, field):
        if not self.processes.data:
            raise ValidationError(u'Необходимо выбрать хотя бы один процесс')


class TestForm(Form):
    __MAX_QUESTIONS_WITH_MANY_ANSWERS = 2
    __MAX_QUESTIONS_WITH_ONE_ANSWER = 13
    questions_with_many_answers = fields.FieldList(_MultiCheckboxField(coerce=int, default=0),
                                                   max_entries=__MAX_QUESTIONS_WITH_MANY_ANSWERS)
    questions_with_one_answer = fields.FieldList(fields.SelectField(coerce=int, default=0),
                                                 max_entries=__MAX_QUESTIONS_WITH_ONE_ANSWER)
    next_page = fields.SubmitField(label=u'Далее')
    finish = fields.SubmitField(label=u'Завершить')

    def __init__(self, *args, **kwargs):
        super(self.__class__, self).__init__(*args, **kwargs)
        if 'questions' in kwargs:
            # Установка вопросов в форму
            questions = kwargs['questions']
            for i in range(0, len(questions)):
                question = questions[i]
                # Если количество правильных ответов равно 1, то создаём RadioField для этого вопроса
                if len(question.correct_answers) == 1:
                    if len(self.questions_with_one_answer.entries) < self.__MAX_QUESTIONS_WITH_ONE_ANSWER:
                        self.questions_with_one_answer.append_entry(fields.SelectField(coerce=int, default=None))
                    # Первые два вопроса предполагают несколько правильных ответов, поэтому смещение тут -2
                    self.questions_with_one_answer.entries[i - 2].label = question.name
                    self.questions_with_one_answer.entries[i - 2].choices = question.question_variants(True)
                # Количество правильных ответов больше одного, создаём MultiCheckBox для этого вопроса
                elif len(question.correct_answers) != 1:
                    if len(self.questions_with_many_answers.entries) < self.__MAX_QUESTIONS_WITH_MANY_ANSWERS:
                        self.questions_with_many_answers.append_entry(_MultiCheckboxField(coerce=int, default=None))
                    self.questions_with_many_answers.entries[i].label = question.name
                    self.questions_with_many_answers.entries[i].choices = question.question_variants(False)
        else:
            raise ValueError('TestForm needed in questions for set in form')
        self.questions_with_one_answer.errors = []
        self.questions_with_many_answers.errors = []

    def validate(self):
        """
        Метод валидации формы
        :return: bool
        """
        # Проверяем вопросы, предполагающие несколько правильных ответов (CheckBox)
        for entry in self.questions_with_many_answers.entries:
            if not entry.data:
                self.questions_with_many_answers.errors.append(u'На вопросы, предполагающие несколько ответов, '
                                                               u'необходимо дать по крайней мере один ответ')
                return False
        # Проверяем вопросы, предполагающие один правильный ответ (RadioBox)
        for entry in self.questions_with_one_answer.entries:
            if entry.data == 0:
                self.questions_with_one_answer.errors.append(u'Необходимо ответить на все вопросы')
                return False

        return True


class LoginForm(Form):
    username = fields.StringField(u'Логин', validators=[MyInputRequired()])
    password = fields.PasswordField(u'Пароль', validators=[MyInputRequired()])
    user = None
    # WTForms supports "inline" validators
    # of the form `validate_[fieldname]`.
    # This validator will run after all the
    # other validators have passed.

    def validate_password(self, field):
        try:
            user = User.query.filter(User.username == self.username.data).one()
        except (MultipleResultsFound, NoResultFound):
            raise ValidationError(u'Пользователь %s не зарегистрирован в системе' % self.username.data)
        if user is None:
            raise ValidationError(u'Пользователь %s не зарегистрирован в системе' % self.username.data)
        if not user.is_valid_password(self.password.data):
            raise ValidationError(u'Неверный пароль')
        # Make the current user available
        # to calling code.
        self.user = user


class RegisteredUserForm(Form):
    username = fields.StringField(u'Логин', validators=[MyInputRequired()])
    password = fields.PasswordField(u'Пароль', validators=[MyInputRequired()])
    retry_password = fields.PasswordField(u'Повтор пароля', validators=[MyInputRequired()])
    role = fields.SelectField(u'Роль', choices=ROLES)
    prev = fields.SubmitField(u'Назад')
    submit = fields.SubmitField(u'Зарегистрировать')

    def validate_username(self, field):
        user = User.query.filter(User.username == field.data).first()
        if user is not None:
            raise ValidationError(u'Пользователь %s уже зарегистрирован в системе' % self.username.data)

    def validate_role(self, field):
        role = Role.role_by_name(field.data).one()
        try:
            User.user_by_role_id(role.id).one()
        except NoResultFound:
            pass
        else:
            raise ValidationError(u'%s уже зарегистрирован в системе' % self.role.data)

    def validate_password(self, field):
        password = str(field.data)
        retry_password = self.retry_password.data
        if not password == retry_password:
            raise ValidationError(u'Пароли не совпадают')
        if USE_PASSWORD_POLICY:
            if len(password) < 8:
                raise ValidationError(u'Пароль должен состоять как минимум из 8 символов')
            import re
            if not re.search('[0-9]', password) or not re.search('[a-zA-Z]', password):
                raise ValidationError(u'Пароль должен содержать символы [0-9a-zA-Z]')


class DeleteUserForm(Form):
    users = _MultiCheckboxField(coerce=int, default=0)
    prev = fields.SubmitField(u'Назад')
    submit = fields.SubmitField(u'Удалить')

    def __init__(self, *args, **kwargs):
        super(self.__class__, self).__init__(*args, **kwargs)
        self.users.choices = [(user.id, user.username) for user in User.users().all()]

    def validate_users(self, field):
        if not field.data:
            raise ValidationError(u'Вы должны выбрать хотя бы одного пользователя')
