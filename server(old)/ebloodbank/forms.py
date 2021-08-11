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
    firstName = StringField('First Name',
                           validators=[DataRequired(), Length(min=2, max=20)], render_kw={"placeholder": "Enter Your First Name"})
    lastName = StringField('Last Name',
                           validators=[DataRequired(), Length(min=2, max=20)], render_kw={"placeholder": "Enter Your Last Name"})
    email = StringField('Email',
                        validators=[DataRequired(), Email()], render_kw={"placeholder": "Enter Email"})
    bloodGroup = StringField('Blood Group',
                           validators=[DataRequired()], render_kw={"placeholder": "Enter Your Bloodgroup"})
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