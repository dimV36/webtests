# coding=utf-8
__author__ = 'dimv36'
from wtforms.validators import StopValidation


class MyInputRequired(object):
    field_flags = ('required', )

    def __init__(self, message=None):
        self.message = message

    def __call__(self, form, field):
        if not field.raw_data or not field.raw_data[0]:
            if self.message is None:
                message = field.gettext(u'Поле \'%s\' необходимо для заполнения.' % field.label.text)
            else:
                message = self.message

            field.errors[:] = []
            raise StopValidation(message)
