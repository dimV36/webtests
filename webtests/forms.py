# coding=utf-8
from flask_wtf import Form
from sqlalchemy.orm.exc import MultipleResultsFound, NoResultFound
from wtforms import fields, widgets
from webtests.validators.validators import MyInputRequired
from wtforms.validators import ValidationError
# from admin import get_investment_levels, get_organization_processes
from dbquery import investment_levels, organization_processes, user_choice, questions, question_variants
from models import User, InvestmentLevel, UsersChoices, Process
from roles import ROLES


class _MultiCheckboxField(fields.SelectMultipleField):
    widget = widgets.ListWidget(prefix_label=False)
    option_widget = widgets.CheckboxInput()


class _HeadmasterForm(Form):
    variants = fields.RadioField(coerce=int, default=0)


class _CSOForm(Form):
    variants = _MultiCheckboxField(coerce=int, default=0)


class _QuestionForm(Form):
    variants = fields.RadioField(coerce=int, default=0, choices=[])


class _QuestionFormList(Form):
    questions = fields.FieldList(fields.FormField(_QuestionForm))


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

    def validate_username(self, field):
        user = User.query.filter(User.username == field.data).first()
        if user is not None:
            raise ValidationError(u'Пользователь %s уже зарегистрирован в системе' % self.username.data)

    def validate_role(self, field):
        user = User.query.filter(User.role == field.data).first()
        if user is not None:
            raise ValidationError(u'%s уже зарегистрирован в системе' % self.role.data)

    def validate_password(self, field):
        retry_password = self.retry_password.data
        if not field.data == retry_password:
            raise ValidationError(u'Пароли не совпадают')


def HeadmasterFormDynamic(is_headmaster_start_testing):
    form = _HeadmasterForm()
    form.variants.choices = [(level.id, level.name) for level in investment_levels()]
    if is_headmaster_start_testing:
        form.variants.process_data(user_choice('investment_level').variant)
    return form


def CSOFormDynamic():
    form = _CSOForm()
    form.variants.choices = [(process.id, process.name) for process in organization_processes()]
    return form


def TestFormDynamic(process):
    form = _QuestionFormList()
    questions_by_process = questions(process)
    for i in range(0, len(questions_by_process)):
        question = questions_by_process[i]
        question_form = _QuestionForm()
        form.questions.append_entry(question_form)
        form.questions.entries[i].label = question.name
        form.questions.entries[i].variants.choices = question_variants(question)
    print('\n')
    print(len(form.questions.entries))
    form.questions.max_entries = len(questions_by_process)
    return form
