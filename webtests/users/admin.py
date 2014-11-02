__author__ = 'user'
from models import User
from sqlalchemy.orm.exc import NoResultFound
__ADMIN_USER = 'admin'
__ADMIN_ROLE = 'admin_role'


def create_admin():
    admin = None
    try:
        admin = User.query.filter(User.username == __ADMIN_USER).one()
    except NoResultFound:
        pass
    if admin is None:
        User.create(username=__ADMIN_USER, password='123456', role=__ADMIN_ROLE)