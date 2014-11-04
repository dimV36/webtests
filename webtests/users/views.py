# coding=utf-8
from flask import Blueprint, redirect, render_template, url_for, g, request
from flask_login import login_required, login_user, logout_user, current_user

from admin import __ADMIN_USER
from forms import LoginForm, RegistrationForm
from models import User

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
    return render_template('users/user.html')