# coding=utf-8
from flask_wtf import Form
from sqlalchemy.orm.exc import MultipleResultsFound, NoResultFound
from wtforms import fields, widgets
from wtforms.validators import Optional
from webtests.validators.validators import MyInputRequired
from wtforms.validators import ValidationError
from models import Role, User, UserChoice, InvestmentLevel, Process
from roles import ROLES
from config import USE_PASSWORD_POLICY


class _MultiCheckboxField(fields.SelectMultipleField):
    widget = widgets.ListWidget(prefix_label=False)
    option_widget = widgets.CheckboxInput()


class _HeadmasterForm(Form):
    variants = fields.RadioField(coerce=int, default=None)
    scope_variants = fields.RadioField(coerce=int, default=None, choices=[(0, u'КВО'), (1, u'КИИ'),
                                                                          (2, u'КСИИ'), (3, u'АСУ')])


class _CSOForm(Form):
    variants = _MultiCheckboxField(coerce=int, default=0)


class _QuestionForm(Form):
    variants = fields.SelectField(coerce=int, choices=[(0, '0'), (1, '1'), (2, '2'), (3, '3'), (4, '4')],
                                  validators=[Optional()])


class _TestForm(Form):
    questions = fields.FieldList(fields.FormField(_QuestionForm))
    next_page = fields.SubmitField(label=u'Далее')
    finish = fields.SubmitField(label=u'Завершить')

    def validate_questions(self, field):
        for entry in self.questions.entries:
            print(self.questions.data)
            if entry.variants.data == 0:
                raise ValidationError(u'Необходимо ответить на все вопросы')


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


class RegistrationForm(Form):
    username = fields.StringField(u'Логин', validators=[MyInputRequired()])
    password = fields.PasswordField(u'Пароль', validators=[MyInputRequired()])
    retry_password = fields.PasswordField(u'Повтор пароля', validators=[MyInputRequired()])
    role = fields.SelectField(u'Роль', choices=ROLES)
    registration = fields.SubmitField(u'Зарегистрировать')

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


def HeadmasterFormDynamic(is_headmaster_start_testing):
    form = _HeadmasterForm()
    form.variants.choices = [(level.id, level.name) for level in InvestmentLevel.investment_levels()]
    if is_headmaster_start_testing:
        form.variants.process_data(UserChoice.user_choice_chosen_investment_level().one().choice)
        form.scope_variants.process_data(UserChoice.user_choice_question(u'Сфера деятельности организации').one().choice)
    return form


def CSOFormDynamic():
    form = _CSOForm()
    form.variants.choices = [(process.id, process.name) for process in Process.processes()]
    return form


def TestFormDynamic(questions_by_process):
    form = _TestForm()
    if not form.questions.entries:
        for i in range(0, len(questions_by_process)):
            question = questions_by_process[i]
            question_form = _QuestionForm()
            form.questions.append_entry(question_form)
            form.questions.entries[i].label = question.name
            form.questions.entries[i].variants.choices = [(0, '')] + question.question_variants()
    else:
        for i in range(0, len(questions_by_process)):
            question = questions_by_process[i]
            form.questions.entries[i].label = question.name
            form.questions.entries[i].variants.choices = [(0, '')] + question.question_variants()
    return form