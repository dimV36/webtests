# coding=utf-8
__author__ = 'dimv36'
from wtforms.validators import StopValidation


class MyInputRequired(object):
    """
    Класс валидатора для полей, которые требуют ответа
    """
    field_flags = ('required', )

    def __init__(self, message=None):
        self.message = message

    def __call__(self, form, field):
        if not field.raw_data or not field.raw_data[0]:
            if self.message is None:
                message = field.gettext(u'Это поле необходимо заполнить.')
            else:
                message = self.message

            field.errors[:] = []
            raise StopValidation(message)

    def __repr__(self):
        return self.message.encode('utf-8')
