# coding=utf-8
from flask import render_template, flash, redirect
from forms import LoginForm
from app import app


# @app.route('/')
# @app.route('/index')
# def index():
#     return render_template("index.html",
#                            title='Home',
#                            user=user,
#                            posts=posts)


@app.route('/login', methods=['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        flash('Login requested for user: %s, password: %s, remember: %s' % (form.username, form.password,
                                                                            str(form.remember_me)))
        return redirect('/index')
    return render_template('login.html', title=u'Войти в систему', form=form)
