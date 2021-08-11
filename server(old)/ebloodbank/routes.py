from flask import Flask, render_template, jsonify, request, redirect, url_for
from flask_login import login_user, current_user, logout_user, login_required
import sqlite3
from ebloodbank import app, db, bcrypt
from ebloodbank.models import User, MyAdminIndexView, AdminView, Newsletter
from ebloodbank.forms import RegistrationForm, LoginForm, NewsletterForm
from flask_admin import Admin

# hashed_password = bcrypt.generate_password_hash("susan").decode('utf-8')
# user = User(userName="SUSN", firstName="sjdhf", lastName="skjdhf", email="sushansujakhu14@gmail.com", bloodGroup="B+", password=hashed_password, role="ADMIN")
# db.session.add(user)
db.create_all()

admin_created = User.query.filter_by(role = "ADMIN").first()
if admin_created is None:
	admin_password = bcrypt.generate_password_hash("1432117").decode('utf-8')
	user = User(firstName='Dipesh', lastName='Deuja', email='deujadipesh1407@gmail.com', phoneNumber='9863039154', address='Suryabinayak-12', bloodGroup='O +ve', gender='Male', age='23', password=admin_password, role="ADMIN")
	db.session.add(user)
	db.session.commit()

admin = Admin(app, name='Dashboard', index_view = MyAdminIndexView())
admin.add_view(AdminView(User, db.session))
admin.add_view(AdminView(Newsletter, db.session))

@app.route("/", methods=['GET','POST'])
# @login_required
def home():
	form = NewsletterForm()
	if request.method == 'POST':
		if form.validate_on_submit():
			email = Newsletter(email=form.email.data)
			db.session.add(email)
			db.session.commit()
	return render_template(
		'/ebloodbank/home.djhtml'
		)

@app.route("/register", methods=['GET','POST'])
def user_registration():
	form = RegistrationForm()
	if request.method == 'POST':
		if form.validate_on_submit():
			hashed_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
			user = User(firstName=form.firstName.data, lastName=form.lastName.data, email=form.email.data, phoneNumber=form.phoneNumber.data, address=form.address.data, bloodGroup=form.bloodGroup.data, gender=form.gender.data, age=form.age.data, password=hashed_password)
			db.session.add(user)
			db.session.commit()
			print('success')
		else:
			print('failed')
	return render_template(
		'/ebloodbank/dashboard/register.djhtml', form=form
		)

@app.route("/login", methods=['GET','POST'])
def user_login():
	form = LoginForm()
	if request.method == 'POST':
		if form.validate_on_submit():
			user = User.query.filter_by(phoneNumber = form.phoneNumber.data).first()
			if user and bcrypt.check_password_hash(user.password, form.password.data):
				login_user(user)
				next_page = request.args.get('next')
				return redirect(next_page) if next_page else redirect(url_for('user_dashboard'))
			else:
				print('Invalid')
	return render_template(
		'/ebloodbank/dashboard/login.djhtml', form=form
		)

@app.route("/logout")
@login_required
def user_logout():
	logout_user()
	return redirect(url_for('home'))

@app.route("/dashboard")
@login_required
def user_dashboard():
	return render_template(
		'/ebloodbank/dashboard/dashboard.djhtml'
		)

@app.route("/dashboard/profile")
@login_required
def user_profile():
	return render_template(
		'/ebloodbank/dashboard/profile.djhtml'
		)

@app.route("/dashboard/user-list")
@login_required
def user_list():
	user = User.query.all()
	return render_template(
		'/ebloodbank/dashboard/user-list.djhtml', user = user
		)

@app.route("/admin")
@login_required
def admin_dashboard():
	user = User.query.all()
	return render_template(
		'/ebloodbank/admin/dashboard.djhtml', user = user
		)