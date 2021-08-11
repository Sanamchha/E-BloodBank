from ebloodbank import db, login_manager
from flask_login import UserMixin, current_user, login_required
from datetime import datetime
# from flask_admin.contrib.sqla import ModelView
# from flask_admin import AdminIndexView
from flask import redirect, url_for

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

# class AdminView(ModelView):
#     def is_accessible(self):
#         return current_user.role == "ADMIN"

#     def inaccessible_callback(self, name, **kwargs):
#         return redirect(url_for('home'))


# class MyAdminIndexView(AdminIndexView):
#     def is_accessible(self):
#         return current_user.role == "ADMIN"
    
#     def inaccessible_callback(self, name, **kwargs):
#         return redirect(url_for('home'))

class User(db.Model, UserMixin):
    __tablename__ = 'user'
    userId = db.Column(db.Integer, primary_key = True)
    role = db.Column(db.Text, nullable = False, default = 'USER')
<<<<<<< HEAD
    # userName = db.Column(db.Text, unique = True, nullable = False)
    name = db.Column(db.Text, nullable = True)
    firstName = db.Column(db.Text, nullable = False)
    lastName = db.Column(db.Text, nullable = False)
=======
    fullName = db.Column(db.Text, nullable = False)
>>>>>>> af095d38678f6ea92af99f8e35d029bd27c6ba50
    email = db.Column(db.Text, unique = True, nullable = False)
    phoneNumber = db.Column(db.Text, unique = True, nullable = False)
    address = db.Column(db.Text, nullable = False)
    lat = db.Column(db.Text, nullable = False)
    lng = db.Column(db.Text, nullable = False)
    bloodGroup = db.Column(db.Text, nullable = False)
    gender = db.Column(db.Text, nullable = False)
    age = db.Column(db.Text, nullable = False)
    userType = db.Column(db.Text, nullable = False)
    imageFile = db.Column(db.Text, nullable = True, default = 'default.jpg')
    password = db.Column(db.Text, nullable = False)
    dateRegistered = db.Column(db.DateTime, nullable = True, default = datetime.utcnow)

    messageId = db.relationship('Message', backref = 'message_id', lazy = True) 

    def get_id(self):
        return (self.userId)

    def __repr__(self):
        return f"User('{self.userId}','{self.role}', '{self.fullName}', '{self.email}', '{self.phoneNumber}', '{self.address}', '{self.lat}', '{self.lng}', '{self.bloodGroup}', '{self.gender}', '{self.age}', '{self.userType}', '{self.imageFile}', '{self.dateRegistered}')"

class Message(db.Model):
    __tablename__ = 'message'
    id = db.Column(db.Integer, primary_key = True)
    userId = db.Column(db.Integer, db.ForeignKey('user.userId'), nullable = False)
    message = db.Column(db.Text, nullable = False)
    messageTime = db.Column(db.DateTime, nullable = True, default = datetime.utcnow)

    def __repr__(self):
        return f"Message('{self.userId}', '{self.message}', '{self.messageTime}')"

class Newsletter(db.Model):
    __tablename__ = 'newsletter'
    id = db.Column(db.Integer, primary_key = True)
    email = db.Column(db.Text, unique = True, nullable = False)

    def __repr__(self):
        return f"Newsletter('{self.email}')"

class Notice(db.Model):
    __tablename__ = 'notice'
    id = db.Column(db.Integer, primary_key = True)
    title = db.Column(db.Text, nullable = False)
    description = db.Column(db.Text, nullable = False)
    noticeDate = db.Column(db.DateTime, nullable = True, default = datetime.utcnow().date())

    def __repr__(self):
        return f"Notice('{self.title}', '{self.description}', '{self.noticeDate}')"

class BloodBank(db.Model):
    __tablename__ = 'bloodbank'
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.Text, nullable = False)
    address = db.Column(db.Text, nullable = False)
    contact = db.Column(db.Text, nullable = False)
    dateRegistered = db.Column(db.DateTime, nullable = True, default = datetime.utcnow().date())

    def __repr__(self):
        return f"BloodBank('{self.name}', '{self.address}', '{self.contact}', '{self.dateRegistered}')"

class Ambulance(db.Model):
    __tablename__ = 'ambulance'
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.Text, nullable = False)
    address = db.Column(db.Text, nullable = False)
    contact = db.Column(db.Text, nullable = False)
    dateRegistered = db.Column(db.DateTime, nullable = True, default = datetime.utcnow().date())

    def __repr__(self):
        return f"Ambulance('{self.name}', '{self.address}', '{self.contact}', '{self.dateRegistered}')"
