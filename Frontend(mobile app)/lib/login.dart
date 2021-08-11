import 'dart:convert';
import 'package:Ebloodbank/screens/dashboard.dart';
import 'package:Ebloodbank/screens/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
import 'signup.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  final formkey = GlobalKey<FormState>();
  var errorMsg;
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text('Hello',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                    child: Text('There',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                    child: Text('.',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent)),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: userController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            labelText: 'Phone',
                            prefixIcon: Icon(Icons.phone_android, color: Colors.red,),
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent))),
                        // ignore: missing_return
                        validator: (value) {
                          if (value.trim().isEmpty){
                            return 'Phone number required';
                          }
                        },

                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            prefixIcon: Icon(Icons.lock, color: Colors.red,),
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent))),
                        obscureText: true,
                        // ignore: missing_return
                        validator: (value) {
                          if (value.trim().isEmpty){
                            return 'password required';
                          }
                        },
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        alignment: Alignment(1.0, 0.0),
                        padding: EdgeInsets.only(top: 15.0, left: 20.0),
                        child: InkWell(
                          onTap: (){
                            forget();
                          },
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.redAccent,
                          color: Colors.red,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {
                              print("Login pressed");
                              if(formkey.currentState.validate()){
                                setState(() {
                                _isLoading = true;
                                });
                                signIn(userController.text, passwordController.text);
                              }
                            },
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height:10),

                      errorMsg == null? Container(): 
                        Container(
                          width: 300,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                            color: Colors.redAccent,
                            ),
                          child: Text('Invalid Password or Phone Number',style: TextStyle(color: Colors.white, letterSpacing: 1.5),textAlign: TextAlign.center,)
                        ),
                        
                      
                      SizedBox(height: 20.0),
                      // Container(
                      //   height: 40.0,
                      //   color: Colors.transparent,
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //         border: Border.all(
                      //             color: Colors.black,
                      //             style: BorderStyle.solid,
                      //             width: 1.0),
                      //         color: Colors.transparent,
                      //         borderRadius: BorderRadius.circular(20.0)),

                      //   ),
                      // )
                    ],
                  ),
                )),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'New to E-blood Bank ?',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SignupPage()));
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            )
          ],
        ));
  }

  forget(){
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ForgotPassword()));
  }
  signIn(String user, pass) async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'username': user,
      'password': pass
    };
    var jsonResponse;
    jsonResponse = null;
    var response = await http.post(Uri.parse("http://10.0.2.2:5000/login"), 
    headers: {"Content-type":"application/json"},
    body: jsonEncode(data));
    if(response.statusCode == 202) {

      jsonResponse = json.decode(response.body);
      print(jsonResponse[0]['Latitude']);
      // print(response.body);
      // if(jsonResponse != null) {
      //   setState(() {
      //     _isLoading = false;
      //   });
      //   // sharedPreferences.setString("token", jsonResponse['data']['token']);
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Dashboard()));
      // }
    }
    else {
      setState(() {
        _isLoading = false;
        userController.clear();
        passwordController.clear();
      });
      errorMsg = response.body;
      print("The error message is: ${response.body}");
    }
  }
}

