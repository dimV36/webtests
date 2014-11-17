# coding=utf-8
from flask import redirect, render_template, url_for, g, request
from flask_login import login_required, login_user, logout_user, current_user
from sqlalchemy.orm.exc import NoResultFound

from admin import __ADMIN_USER
from webtests.roles import ROLE_HEAD_OF_ORGANIZATION, ROLE_HEAD_OF_INFORMATION_SECURITY, ROLE_HEAD_OF_STRATEGIC_LEVEL
from forms import LoginForm, RegistrationForm, HeadmasterFormDynamic, CSOFormDynamic, TestFormDynamic
from models import ApplicationData, User, UsersChoices, Process
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
            User.create(username=form.username.data, password=form.password.data, role=form.role.data)
        return render_template('users/register.html', form=form)
    else:
        return u'Вы не можете получить доступ к этой странице.'


@app.route('/headmaster/', methods=('GET', 'POST'))
@login_required
def headmaster():
    if g.user.role == ROLE_HEAD_OF_ORGANIZATION:
        app_data = ApplicationData.headmaster_is_start_testing().one()
        form = HeadmasterFormDynamic(app_data.status)
        if form.validate_on_submit():
            if not app_data.status:
                UsersChoices.create(username=g.user.username, description='investment_level',
                                    variant=form.variants.data)
            else:
                choices = UsersChoices.query.all()
                for choice in choices:
                    UsersChoices.delete(choice)
            app_data.status = bool(not app_data.status)
            app_data.update()
            return redirect(url_for('headmaster'))
        else:
            print(form.errors)
        return render_template('roles/headmaster.html', form=form, testing_is_started=app_data.status)
    else:
        return u'Вы не можете получить доступ к этой странице'


@app.route('/cso/', methods=('GET', 'POST'))
@login_required
def cso():
    if g.user.role == ROLE_HEAD_OF_INFORMATION_SECURITY:
        form = CSOFormDynamic()
        app_data = ApplicationData.cso_choose_processes().one()
        if form.validate_on_submit():
            if not app_data.status:
                for variant in form.variants.data:
                    UsersChoices.create(username=g.user.username, description='processes', variant=variant)
            app_data.status = bool(not app_data.status)
            app_data.update()
        else:
            print(form.errors)
        return render_template('roles/cso.html', form=form, is_cso_choose_processes=app_data.status,
                               is_headmaster_start_testing=ApplicationData.headmaster_is_start_testing().one().status)
    else:
        return u'Вы не можете получить доступ к этой странице'


@app.route('/gm/', methods=('GET', 'POST'))
@app.route('/gm/process<int:page>', methods=['GET', 'POST'])
@login_required
def gm(page=1):
    if g.user.role == ROLE_HEAD_OF_STRATEGIC_LEVEL:
        chosen_processes = UsersChoices.user_choice('processes').paginate(page, 1, False)
        current_process = chosen_processes.items[0]
        form = TestFormDynamic(current_process.variant)
        app_data = ApplicationData.gm_answered_on_questions().one()
        if form.validate_on_submit():
            if not app_data.status:
                # get form data and save to db
                print(form.data)
                # for entry in form.questions.entries:
                #     for variant in entry.variants:
                #         print(entry.data)
                #         UsersChoices.create(username=g.user.username, description='cso_answers', variant=variant.data)
            app_data.status = bool(not app_data.status)
            app_data.update()
            return redirect(url_for('gm'))
        else:
            print('page: ' + str(page) + str(form.data))
            print('prev_page: ' + str(form.prev_page.data))
            print('next_page: ' + str(form.next_page.data))
            print(form.errors)
        return render_template('roles/gm.html', form=form,
                               process_name=Process.process(current_process.variant).name,
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
        if user.role == ROLE_HEAD_OF_ORGANIZATION:
            redirect(url_for('headmaster'))
        elif user.role == ROLE_HEAD_OF_INFORMATION_SECURITY:
            redirect(url_for('cso'))
        elif user.role == ROLE_HEAD_OF_STRATEGIC_LEVEL:
            redirect(url_for('gm'))
