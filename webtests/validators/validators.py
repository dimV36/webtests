# coding=utf-8
__author__ = 'dimv36'
from wtforms.validators import StopValidation
from webtests.admin import get_application_data, HEADMASTER_START_TESTING


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


def choices_validator(self, field):
    is_testing_started = get_application_data(HEADMASTER_START_TESTING).status
    if is_testing_started:
        print('Valid')
    else:
        print('Invalid')