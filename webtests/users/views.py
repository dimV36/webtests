# coding=utf-8
from flask import Blueprint, redirect, render_template, url_for, g, request
from flask_login import login_required, login_user, logout_user, current_user
from sqlalchemy.orm.exc import NoResultFound

from admin import __ADMIN_USER, HEADMASTER_START_TESTING
from roles import ROLE_HEAD_OF_ORGANIZATION
from forms import LoginForm, RegistrationForm, HeadmasterForm
from models import User, ApplicationData

from flask import Blueprint
users = Blueprint('users', __name__)

@users.before_request
def before_request():
    g.user = current_user

@users.route('/admin/', methods=('GET', 'POST'))
@login_required
def register():
    if g.user.username == __ADMIN_USER:
        form = RegistrationForm()
        if form.validate_on_submit():
            User.create(username=form.username.data, password=form.password.data, role=form.role.data)
        return render_template('users/register.html', form=form)
    else:
        return u'Вы не можете получить доступ к этой странице.'


@users.route('/headmaster/', methods=('GET', 'POST'))
@login_required
def headmaster():
    if g.user.role == ROLE_HEAD_OF_ORGANIZATION:
        form = HeadmasterForm()
        app_data = ApplicationData.query.filter(ApplicationData.description == HEADMASTER_START_TESTING).one()
        if app_data is not None:
            pass
             # form.start_testing.process_data(app_data.status)
        else:
            raise NoResultFound(u'Не найдено значение переменной %s', HEADMASTER_START_TESTING)
        form.data.update(app_data.status)
        if form.validate_on_submit():
            app_data.status = bool(form.start_testing.data)
            app_data.update()
        return render_template('roles/headmaster.html', form=form)
    else:
        return u'Вы не можете получить доступ к этой странице'


@users.route('/', methods=('GET', 'POST'))
def login():
    form = LoginForm()
    if form.validate_on_submit():
        login_user(form.user)
        # There's a subtle security hole in this code, which we will be fixing in our next article.
        # Don't use this exact pattern in anything important.
        return redirect('/%s' % g.user.username)
    return render_template('users/login.html', form=form)


@users.route('/logout/')
@login_required
def logout():
    logout_user()
    return redirect(url_for('users.login'))


@users.route('/<username>', methods=('GET', 'POST'))
@login_required
def user_page(username):
    user = None
    try:
        user = User.query.filter(User.username == username).one()
    except NoResultFound:
        pass
    if user is not None:
        if user.role == ROLE_HEAD_OF_ORGANIZATION:
            redirect(url_for('users.headmaster'))
#    return render_template('users/user.html')