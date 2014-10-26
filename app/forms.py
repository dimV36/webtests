# coding=utf-8
__author__ = 'dimv36'
from flask_wtf import Form
from wtforms import StringField, PasswordField, BooleanField
from wtforms.validators import DataRequired
from app.models import User


class LoginForm(Form):
    username = StringField(u'Логин', validators=[DataRequired()])
    password = PasswordField(u'Пароль', validators=[DataRequired()])
    remember_me = BooleanField(u'Запомнить', default=False)

    def __init__(self):
        Form.__init__(self)
        self.user = None

    def validate(self):
        validate = Form.validate(self)
        if not validate:
            return False

        user = User.query.filter_by(username=self.username.data).first()
        if user is None:
            self.username.errors.append('Unknown username')
            return False

        if not user.check_password(self.password.data):
            self.password.errors.append('Invalid password')
            return False

        self.user = user
        return True