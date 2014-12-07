# coding=utf-8
__author__ = 'dimv36'

ROLE_ADMIN = 'Administrator'

ROLE_HEAD_OF_ORGANIZATION = 'headmaster'
ROLE_HEAD_OF_INFORMATION_SECURITY = 'CSO'
ROLE_HEAD_OF_BASE_LEVEL = 'CIO'
ROLE_HEAD_OF_OPERATIONAL_LEVEL = 'OM'
ROLE_HEAD_OF_TACTICAL_LEVEL = 'TM'

ROLES_FOR_TESTING = [ROLE_HEAD_OF_INFORMATION_SECURITY, ROLE_HEAD_OF_BASE_LEVEL,
                     ROLE_HEAD_OF_OPERATIONAL_LEVEL, ROLE_HEAD_OF_TACTICAL_LEVEL]

USER_ROLES = [ROLE_ADMIN, ROLE_HEAD_OF_ORGANIZATION] + ROLES_FOR_TESTING

ROLES = [(ROLE_HEAD_OF_ORGANIZATION, u'Руководитель организации'),
         (ROLE_HEAD_OF_INFORMATION_SECURITY, u'Начальник службы ИБ'),
         (ROLE_HEAD_OF_BASE_LEVEL, u'Начальник базового уровня'),
         (ROLE_HEAD_OF_OPERATIONAL_LEVEL, u'Управляющий оперативного уровня'),
         (ROLE_HEAD_OF_TACTICAL_LEVEL, u'Управляющий тактического уровня')
]