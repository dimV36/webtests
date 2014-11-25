# coding=utf-8
from flask import redirect, render_template, url_for, g, flash
from flask_login import login_required, login_user, logout_user, current_user
from sqlalchemy.orm.exc import NoResultFound

from admin import __ADMIN_USER
from webtests.roles import ROLE_HEAD_OF_ORGANIZATION, ROLE_HEAD_OF_INFORMATION_SECURITY, ROLE_HEAD_OF_BASE_LEVEL
from forms import LoginForm, RegistrationForm, HeadmasterFormDynamic, CSOFormDynamic, TestFormDynamic
from models import ApplicationData, Role, User, UserChoice, Process, InvestmentLevel, Question
from webtests import app


@app.before_request
def before_request():
    g.user = current_user
    app_data = ApplicationData.headmaster_is_start_testing().one()
    if not app_data.status:
        ApplicationData.reset_application_data()


@app.route('/admin/', methods=('GET', 'POST'))
@login_required
def register():
    if g.user.username == __ADMIN_USER:
        form = RegistrationForm()
        if form.validate_on_submit():
            print('\n' + form.role.data + '\n')
            role = Role.role_by_name(form.role.data).one()
            User.create(username=form.username.data, password=form.password.data, role_id=role.id)
            flash(u'Пользователь "%s" успешно зарегистрирован в системе.' % form.username.data)
        return render_template('users/register.html', form=form)
    else:
        return u'Вы не можете получить доступ к этой странице.'


@app.route('/headmaster/', methods=('GET', 'POST'))
@login_required
def headmaster():
    if g.user.role.name == ROLE_HEAD_OF_ORGANIZATION:
        app_data = ApplicationData.headmaster_is_start_testing().one()
        form = HeadmasterFormDynamic(app_data.status)
        try:
            investment_level = UserChoice.user_choice_chosen_investment_level()
        except NoResultFound:
            investment_level = None
        if form.validate_on_submit():
            if not app_data.status:
                choice = form.variants.data
                answer = InvestmentLevel().investment_level(choice)
                UserChoice.create_investment_level_choice(g.user.username, choice, answer.one().name)
            else:
                choices = UserChoice.query.all()
                for choice in choices:
                    UserChoice.delete(choice)
            app_data.status = bool(not app_data.status)
            app_data.update()
            return redirect(url_for('headmaster'))
        else:
            print(form.errors)
        return render_template('roles/headmaster.html', form=form,
                               testing_is_started=app_data.status,
                               investment_level=investment_level)
    else:
        return u'Вы не можете получить доступ к этой странице'


@app.route('/cso/', methods=('GET', 'POST'))
@login_required
def cso():
    if g.user.role.name == ROLE_HEAD_OF_INFORMATION_SECURITY:
        form = CSOFormDynamic()
        app_data = ApplicationData.cso_choose_processes().one()
        investment_level = UserChoice.user_choice_chosen_investment_level()
        try:
            processes = UserChoice.user_choice_processes()
        except NoResultFound:
            processes = None
        if form.validate_on_submit():
            if not app_data.status:
                for choice in form.variants.data:
                    answer = Process.process_by_id(choice)
                    UserChoice.create_process_choice(g.user.username, choice, answer.one().name)
            app_data.status = bool(not app_data.status)
            app_data.update()
        else:
            print(form.errors)
        return render_template('roles/cso.html', form=form,
                               is_cso_choose_processes=app_data.status,
                               is_headmaster_start_testing=ApplicationData.headmaster_is_start_testing().one().status,
                               investment_level=investment_level.one().answer,
                               processes=processes)
    else:
        return u'Вы не можете получить доступ к этой странице'


def save_answers_to_db(entries, page):
    process = UserChoice.user_choice('processes').paginate(page, 1, False).items[0]
    questions = Question.chosen_questions(process.choice).all()
    for i in range(0, len(entries)):
        entry = entries[i]
        question_name = questions[i].name
        question = Question.question(question_name).one()
        choice = entry.variants.data
        try:
            UserChoice.user_choice_question(question_name).one()
        except NoResultFound:
            UserChoice.create(username=g.user.username,
                                field='questions',
                                question=question_name,
                                choice=choice,
                                answer=question.question_answer(choice))


@app.route('/gm/', methods=('GET', 'POST'))
@app.route('/gm/process<int:page>', methods=['GET', 'POST'])
@login_required
def gm(page=1):
    if g.user.role.name == ROLE_HEAD_OF_BASE_LEVEL:
        chosen_processes = UserChoice.user_choice_processes_by_role(ROLE_HEAD_OF_BASE_LEVEL).paginate(page, 1, False)
        current_process = chosen_processes.items[0]
        questions_by_process = Question.chosen_questions(current_process.choice).all()
        form = TestFormDynamic(questions_by_process)
        app_data = ApplicationData.gm_answered_on_questions().one()
        if form.validate_on_submit():
            if form.finish.data:
                print('finish: ' + str(page))
                page = chosen_processes.pages
                save_answers_to_db(form.questions, page)
                if not app_data.status:
                    app_data.status = bool(not app_data.status)
                    app_data.update()
            if form.next_page.data:
                save_answers_to_db(form.questions, page)
                page = chosen_processes.next_num
            return redirect(url_for('gm', page=page))
        return render_template('roles/gm.html', form=form,
                               process_name=Process.process_by_id(current_process.choice).one().name,
                               is_cso_choose_processes=ApplicationData.cso_choose_processes().one().status,
                               is_gm_answered_on_questions=app_data.status,
                               processes=chosen_processes)
    else:
        return u'Вы не можете получить доступ к этой странице'


@app.route('/', methods=('GET', 'POST'))
def login():
    form = LoginForm()
    if form.validate_on_submit():
        login_user(form.user)
        # There's a subtle security hole in this code, which we will be fixing in our next article.
        # Don't use this exact pattern in anything important.
        return redirect('/%s' % g.user.username)
    return render_template('users/login.html', form=form)


@app.route('/logout/')
@login_required
def logout():
    logout_user()
    return redirect(url_for('login'))


@app.route('/<username>', methods=('GET', 'POST'))
@login_required
def user_page(username):
    user = None
    try:
        user = User.query.filter(User.username == username).one()
    except NoResultFound:
        pass
    if user is not None:
        if user.role.name == ROLE_HEAD_OF_ORGANIZATION:
            return redirect(url_for('headmaster'))
        elif user.role.name == ROLE_HEAD_OF_INFORMATION_SECURITY:
            return redirect(url_for('cso'))
        elif user.role.name == ROLE_HEAD_OF_BASE_LEVEL:
            return redirect(url_for('gm', page=1))
