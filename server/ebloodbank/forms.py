from enum import unique
from flask_wtf import FlaskForm
from flask_wtf.file import FileField, FileAllowed
from flask_login import current_user
from wtforms import StringField, PasswordField, SubmitField, BooleanField, TextAreaField
from wtforms.fields.core import IntegerField, RadioField, SelectField
from wtforms.fields.simple import HiddenField
from wtforms.validators import DataRequired, Length, Email, EqualTo, ValidationError
from ebloodbank.models import User

class RegistrationForm(FlaskForm):
    fullName = StringField('Full Name',
                           validators=[DataRequired(), Length(min=2, max=20)], render_kw={"placeholder": "Enter Your Name"})
    email = StringField('Email',
                        validators=[DataRequired(), Email()], render_kw={"placeholder": "Enter Email"})
    phoneNumber = StringField('Phone Number',
                           validators=[DataRequired()], render_kw={"placeholder": "Enter Your Phone Number"})
    address = StringField('Address',
                           validators=[DataRequired()], render_kw={"placeholder": "Enter Your Address"})
    bloodGroup = StringField('Blood Group',
                           validators=[DataRequired()], render_kw={"placeholder": "Enter Your Bloodgroup"})
    gender = StringField('Gender',
                           validators=[DataRequired()], render_kw={"placeholder": "Enter Your Gender"})
    age = StringField('Age',
                           validators=[DataRequired()], render_kw={"placeholder": "Enter Your Age"})
    userType = StringField('User Type',
                           validators=[DataRequired()], render_kw={"placeholder": "User Type"})
    password = PasswordField('Password', validators=[DataRequired()], render_kw={"placeholder": "Password"})
    confirm_password = PasswordField('Confirm Password',
                                     validators=[DataRequired(), EqualTo('password')], render_kw={"placeholder": "Re-Password"})
    submit = SubmitField('Sign Up')

    def validate_email(self, email):
        email = User.query.filter_by(email=email.data).first()
        if email:
            raise ValidationError('Email already Registered')


class LoginForm(FlaskForm):
    phoneNumber = StringField('Phone Number',
                           validators=[DataRequired()], render_kw={"placeholder": "Enter Your Phone Number"})
    password = PasswordField('Password', validators=[DataRequired()], render_kw={"placeholder": "Password"})
    remember = BooleanField('Remember Me')
    submit = SubmitField('Login')

class NewsletterForm(FlaskForm):
    email = StringField('Email',
                        validators=[DataRequired(), Email()], render_kw={"placeholder": "Enter Email"})
    submit = SubmitField('Subscribe')
    def validate_email(self, email):
        email = User.query.filter_by(email=email.data).first()
        if email:
            raise ValidationError('Email already Subscribed')


class NoticeForm(FlaskForm):
    title = StringField('Notice Title',
                           validators=[DataRequired()], render_kw={"placeholder": "Notice Title"})
    description = StringField('Notice Description',
                           validators=[DataRequired()], render_kw={"placeholder": "Notice Description"})
    submit = SubmitField('Publish')

class BloodBankForm(FlaskForm):
    name = StringField('Name',
                           validators=[DataRequired()], render_kw={"placeholder": "Name"})
    address = StringField('Address',
                           validators=[DataRequired()], render_kw={"placeholder": "Address"})
    contact = StringField('Contact',
                           validators=[DataRequired()], render_kw={"placeholder": "Contact"})
    submit = SubmitField('Save')

class AmbulanceForm(FlaskForm):
    name = StringField('Name',
                           validators=[DataRequired()], render_kw={"placeholder": "Name"})
    address = StringField('Address',
                           validators=[DataRequired()], render_kw={"placeholder": "Address"})
    contact = StringField('Contact',
                           validators=[DataRequired()], render_kw={"placeholder": "Contact"})
    submit = SubmitField('Save')