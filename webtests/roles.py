# coding=utf-8
__author__ = 'dimv36'


ROLE_ADMIN = 'Administrator'

ROLE_HEAD_OF_ORGANIZATION = 'headmaster'
ROLE_HEAD_OF_INFORMATION_SECURITY = 'CSO'
ROLE_HEAD_OF_STRATEGIC_LEVEL = 'GM'
ROLE_HEAD_OF_OPERATIONAL_LEVEL = 'OM'
ROLE_HEAD_OF_TACTICAL_LEVEL = 'TM'
ROLE_HEAD_OF_BASE_LEVEL = 'CM'

ROLES_FOR_TESTING = [ROLE_HEAD_OF_STRATEGIC_LEVEL, ROLE_HEAD_OF_OPERATIONAL_LEVEL,
                     ROLE_HEAD_OF_TACTICAL_LEVEL, ROLE_HEAD_OF_BASE_LEVEL]


ROLES = [(ROLE_HEAD_OF_ORGANIZATION, u'Руководитель организации'),
    (ROLE_HEAD_OF_INFORMATION_SECURITY, u'Начальник службы ИБ'),
    (ROLE_HEAD_OF_STRATEGIC_LEVEL, u'Начальник стратегического уровня'),
    (ROLE_HEAD_OF_TACTICAL_LEVEL, u'Управляющий тактического уровня'),
    (ROLE_HEAD_OF_OPERATIONAL_LEVEL, u'Управляющий операционного уровня'),
    (ROLE_HEAD_OF_BASE_LEVEL, u'Управляющий базового уровня')
]