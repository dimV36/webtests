# coding=utf-8
from flask import render_template, flash, redirect, url_for, session
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
        flash(u'Successfully logged in as %s' % form.user.username)
        session['user_id'] = form.user.id
        return redirect(url_for('index'))
    return render_template('login.html', form=form)