# coding=utf-8
from flask import redirect, render_template, url_for, g, flash
from flask_login import login_required, login_user, logout_user, current_user
from sqlalchemy.orm.exc import NoResultFound

from admin import __ADMIN_USER, HEADMASTER_START_TESTING
from admin import get_application_data, get_investment_levels
from webtests.roles import ROLE_HEAD_OF_ORGANIZATION
from forms import LoginForm, RegistrationForm, HeadmasterForm
from models import User
from webtests import app


@app.before_request
def before_request():
    g.user = current_user

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
        form = HeadmasterForm()
        app_data = get_application_data(HEADMASTER_START_TESTING)
        if form.validate_on_submit():
            print(form.data)
            app_data.status = bool(not app_data.status)
            app_data.update()
        return render_template('roles/headmaster.html', form=form, testing_is_started=app_data.status)
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
