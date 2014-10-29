from flask_wtf import Form
from sqlalchemy.orm.exc import MultipleResultsFound, NoResultFound
from wtforms import fields
from wtforms.validators import InputRequired, ValidationError

from models import User


class LoginForm(Form):
    def __init__(self):
        super(Form).__init__()
        self.username = fields.StringField(validators=[InputRequired()])
        self.password = fields.StringField(validators=[InputRequired()])
        self.user = None
    # username = fields.StringField(validators=[InputRequired()])
    # password = fields.StringField(validators=[InputRequired()])

    # WTForms supports "inline" validators
    # of the form `validate_[fieldname]`.
    # This validator will run after all the
    # other validators have passed.
    def validate_password(self, field):
        try:
            user = User.query.filter(User.email == self.username.data).one()
        except (MultipleResultsFound, NoResultFound):
            raise ValidationError("Invalid user")
        if user is None:
            raise ValidationError("Invalid user")
        if not user.is_valid_password(self.password.data):
            raise ValidationError("Invalid password")

        # Make the current user available
        # to calling code.
        self.user = user


class RegistrationForm(Form):
    name = fields.StringField("Display Name")
    email = fields.StringField(validators=[InputRequired()])
    password = fields.StringField(validators=[InputRequired()])

    def validate_email(form, field):
        user = User.query.filter(User.email == field.data).first()
        if user is not None:
            raise ValidationError("A user with that email already exists")
