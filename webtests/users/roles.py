# coding=utf-8
__author__ = 'dimv36'


ROLE_ADMIN = 'Administrator'
ROLE_HEAD_OF_ORGANIZATION = u'Руководитель организации'
ROLE_HEAD_OF_INFORMATION_SECURITY = u'Начальник службы ИБ'
ROLE_HEAD_OF_STRATEGIC_LEVEL = u'Начальник стратегического уровня'
ROLE_HEAD_OF_TACTICAL_LEVEL = u'Управляющий тактического уровня'
ROLE_HEAD_OF_OPERATIONAL_LEVEL = u'Управляющий операционного уровня'
ROLE_HEAD_OF_BASE_LEVEL = u'Управляющий базового уровня'

ROLES = [('headmaster', ROLE_HEAD_OF_ORGANIZATION),
    ('CSO', ROLE_HEAD_OF_INFORMATION_SECURITY),
    ('GM', ROLE_HEAD_OF_STRATEGIC_LEVEL),
    ('OM', ROLE_HEAD_OF_TACTICAL_LEVEL),
    ('TM', ROLE_HEAD_OF_OPERATIONAL_LEVEL),
    ('CM', ROLE_HEAD_OF_BASE_LEVEL)
]