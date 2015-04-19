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
    widget = widgets.TableWidget()
    option_widget = widgets.CheckboxInput()


class _HeadmasterForm(Form):
    variants = fields.RadioField(coerce=int, default=None)

# class BaseSurveyForm(Form):
#     # define your base fields here
#
#
# def show_survey(survey_id):
#     survey_information = get_survey_info(survey_id)
#
#     class SurveyInstance(BaseSurveyForm):
#         pass
#
#     for question in survey_information:
#         field = generate_field_for_question(question)
#         setattr(SurveyInstanceForm, question.backend_name, field)
#
#     form = SurveyInstanceForm(request.form)
#
#     # Do whatever you need to with form here
#
#
# def generate_field_for_question(question):
#     if question.type == "truefalse":
#         return BooleanField(question.text)
#     elif question.type == "date":
#         return DateField(question.text)
#     else:
#         return TextField(question.text)


class CSOForm(Form):
    processes = _MultiCheckboxField(coerce=int, default=0, choices=Process.processes())

    def validate_processes(self, field):
        if not self.processes.data:
            raise ValidationError(u'Необходимо выбрать хотя бы один процесс')


class TestForm(Form):
    questions_with_one_answer = fields.FieldList(fields.SelectField(coerce=int, default=0, validators=[Optional()]))
    questions_with_many_answers = fields.FieldList(_MultiCheckboxField(coerce=int, default=0, validators=[Optional()]))
    next_page = fields.SubmitField(label=u'Далее')
    finish = fields.SubmitField(label=u'Завершить')

    def __init__(self, formdata=None, obj=None, prefix='', data=None, meta=None, **kwargs):
        super(self.__class__, self).__init__(formdata=None, obj=None, prefix='', **kwargs)
        if 'questions' in kwargs:
            # Установка вопросов в форму
            questions = kwargs['questions']
            # self.__set_questions_to_form(kwargs['questions'])
            for i in range(0, len(questions)):
                question = questions[i]
                if len(question.correct_answers) == 1:
                    self.questions_with_one_answer.append_entry(fields.SelectField(coerce=int, default=None))
                    self.questions_with_one_answer.entries[i - 2].label = question.name
                    self.questions_with_one_answer.entries[i - 2].choices = question.question_variants(True)
                else:
                    question_form = _MultiCheckboxField(coerce=int, default=None)
                    question_form.label = question.name
                    self.questions_with_many_answers.append_entry(question_form)
                    self.questions_with_many_answers.entries[i].label = question.name
                    self.questions_with_many_answers.entries[i].choices = question.question_variants(False)
        else:
            raise ValueError('TestForm needed in questions for set in form')

    def __set_questions_to_form(self, questions):
        pass

    def validate_questions_with_one_answer(self, field):
        for entry in self.questions_with_one_answer.entries:
            if entry.data == 0:
                raise ValidationError(u'Необходимо ответить на все вопросы')

    def validate_questions_with_many_answers(self, field):
        print('\nvalidate_questions_with_many_answers\n')
        for entry in self.questions_with_many_answers.entries:
            print('entry: %s' % entry.data)
            # if not entry.data:
            #     raise ValidationError(u'На вопросы, предполагающие несколько ответов, необходимо дать по крайней '
            #                           u'мере один ответ')


class _QuestionForm(Form):
    variants = fields.SelectField(coerce=int, choices=[(0, '0'), (1, '1'), (2, '2'), (3, '3'), (4, '4')],
                                  validators=[Optional()])


class _TestForm(Form):
    questions = fields.FieldList(fields.FormField(_QuestionForm))
    next_page = fields.SubmitField(label=u'Далее')
    finish = fields.SubmitField(label=u'Завершить')

    def validate_questions(self, field):
        for entry in self.questions.entries:
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


class _DeleteUserForm(Form):
    users = _MultiCheckboxField(coerce=int, default=0)
    prev = fields.SubmitField(u'Назад')
    submit = fields.SubmitField(u'Удалить')

    def validate_users(self, field):
        if not field.data:
            raise ValidationError(u'Вы должны выбрать хотя бы одного пользователя')


def DeleteUserFormDynamic():
    form = _DeleteUserForm()
    form.users.choices = [(user.id, user.username) for user in User.users().all()]
    return form


def HeadmasterFormDynamic(is_headmaster_start_testing):
    form = _HeadmasterForm()
    form.variants.choices = [(level.id, level.name) for level in InvestmentLevel.investment_levels()]
    if is_headmaster_start_testing:
        form.variants.process_data(UserChoice.user_choice_chosen_investment_level().one().choice)
    return form


def TestFormDynamic(questions_by_process):
    # form = _TestForm()
    new_form = TestForm(questions=questions_by_process)
    # if not form.questions.entries:
    #     for i in range(0, len(questions_by_process)):
    #         question = questions_by_process[i]
    #         question_form = _QuestionForm()
    #         form.questions.append_entry(question_form)
    #         form.questions.entries[i].label = question.name
    #         form.questions.entries[i].variants.choices = [(0, '')] + question.question_variants()
    # else:
    #     for i in range(0, len(questions_by_process)):
    #         question = questions_by_process[i]
    #         form.questions.entries[i].label = question.name
    #         form.questions.entries[i].variants.choices = [(0, '')] + question.question_variants()
    # return form
    return new_form