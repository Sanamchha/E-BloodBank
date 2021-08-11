import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:Ebloodbank/screens/passwordprovider.dart';


class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-BloodBank 🩸',textScaleFactor: 1.1,),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height: 70),
            Text(
              "FORGOT PASSWORD?", 
              style: TextStyle(
                fontSize: 30.0, 
                fontWeight: FontWeight.bold, 
                color: Colors.redAccent,
                fontFamily: 'Montserrat',
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20,),

            Text(
              'Enter an email address associated with your account',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey
              ),
              textAlign: TextAlign.center,
            ),

            Text(
              'We will send you a link to reset your password',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Montserrat',
                color: Colors.grey
              ),
              textAlign: TextAlign.center,
             
            ),

            SizedBox(height: 20),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 50,),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Enter your email',
                  labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent)
                  ),
                ),
              ),
            ),

            SizedBox(height: 20,),

            GestureDetector(
              child: Container(
                height: 25,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.redAccent,
                ),
                child: Text(
                  'SUBMIT',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>ProvidePassword()));
              },              
            ),

          ],
        ),
      ),
    );
  }
}