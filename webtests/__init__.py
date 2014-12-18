from flask import Flask

from auth import login_manager
from data import db, images
from webtests.admin import create_entities

app = Flask(__name__)
app.config.from_object('config')

db.init_app(app)
db.app = app

images.init_app(app)
images.app = app

login_manager.init_app(app)

db.create_all(app=app)
create_entities()

from webtests import views, models