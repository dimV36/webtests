# coding=utf-8
__author__ = 'dimv36'
from flask_wtf import Form
from wtforms import StringField, PasswordField, BooleanField
from wtforms.validators import DataRequired


class LoginForm(Form):
    username = StringField(u'Логин', validators=[DataRequired()])
    password = PasswordField(u'Пароль', validators=[DataRequired()])
    remember_me = BooleanField(u'Запомнить', default=False)