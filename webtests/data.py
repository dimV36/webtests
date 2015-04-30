# coding=utf-8
from flask_sqlalchemy import SQLAlchemy
from flask_images import Images

# Создание подключения к базе данных
db = SQLAlchemy()
# Создание модуля, обеспечивающий динамическую установку изображений
images = Images()


class CRUDMixin(object):
    """
    Вспомогатеьный класс, реализующий основной функционал по созданию/удалению/обновлению
    записей в БД
    """
    __table_args__ = {'extend_existing': True}

    id = db.Column(db.Integer, primary_key=True)

    @classmethod
    def create(cls, commit=True, **kwargs):
        instance = cls(**kwargs)
        return instance.save(commit=commit)

    @classmethod
    def get(cls, id):
        return cls.query.get(id)

    @classmethod
    def get_or_404(cls, id):
        return cls.query.get_or_404(id)

    def update(self, commit=True, **kwargs):
        for attr, value in kwargs.iteritems():
            setattr(self, attr, value)
        return commit and self.save() or self

    def save(self, commit=True):
        db.session.add(self)
        if commit:
            db.session.commit()
        return self

    def delete(self, commit=True):
        db.session.delete(self)
        return commit and db.session.commit()
