from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from flask_login import LoginManager
from flask_mail import Mail, Message
from sqlalchemy_utils.functions import database_exists

app = Flask(__name__,
	template_folder='../templates',
	static_folder='../static')

app.config.from_object("config.DevelopmentConfig")
app.jinja_env.add_extension('jinja2.ext.do')
app.jinja_env.add_extension('jinja2.ext.loopcontrols')
app.jinja_env.cache = {}

db = SQLAlchemy(app)
bcrypt = Bcrypt(app)
login_manager = LoginManager(app)
mail = Mail(app)
login_manager.login_view = '/login'
login_manager.login_message_category = 'info'


from ebloodbank import routes
