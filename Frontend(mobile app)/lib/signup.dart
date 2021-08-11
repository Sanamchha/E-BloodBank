import 'dart:convert';
import 'package:Ebloodbank/login.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController ageController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController addressController = new TextEditingController();
  final TextEditingController emailController  = new TextEditingController();
  final formkey = GlobalKey<FormState>();
  String chosenBgroup = "Blood Group";
  String chosenGender = "Gender";
  String chosenType = "Both";
  Location location = Location();
  LocationData _currentPosition;
  bool _isLoading = false;
  var errorMsg;


  
  getLoc() async{
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        print(_serviceEnabled);
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    print(_serviceEnabled);
    print(_permissionGranted);

    if(_serviceEnabled == true && _permissionGranted == PermissionStatus.granted){
      _currentPosition = await location.getLocation();
      location.onLocationChanged.listen((LocationData currentLocation) {
        // print("${currentLocation.latitude} : ${currentLocation.longitude}");
        _currentPosition = currentLocation;
      });
    }    
  }



  @override
  void initState() {
    super.initState();
    getLoc();
  }
  
  @override
  Widget build(BuildContext context) {
    List _bloodgroup =['Blood Group','A+','A-','B+','B-','AB+','AB-','O+','O-'];
    List _gender=['Gender','Male','Female','others'];
    List _type=['Donor','Needy','Both'];
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, 
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 60.0, 0.0, 0.0),
                    child: Text(
                      'Signup',
                      style:
                          TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(160.0, 40.0, 0.0, 0.0),
                    child: Text(
                      '.',
                      style: TextStyle(
                          fontSize: 80.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  )
                ],
              ),
            ),
            Form(
              key: formkey,
              child: Container(
                  padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: nameController,
                        // ignore: missing_return
                        validator: (value) {
                          if (value.trim().isEmpty){
                            return 'Fullname required';
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Name',
                            prefixIcon: Icon(Icons.perm_identity, color: Colors.red,),
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            // hintText: 'EMAIL',
                            // hintStyle: ,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red))),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              // ignore: missing_return
                              validator: (value) {
                                if (value.trim().isEmpty){
                                  return 'Age required';
                                }
                              },
                              controller: ageController,
                              decoration: InputDecoration(
                                  labelText: 'Age ',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red))),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: phoneController,
                              // ignore: missing_return
                              validator: (value) {
                                if (value.trim().isEmpty){
                                  return 'Phone number required';
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: 'Contact:  ',
                                  prefixIcon: Icon(Icons.phone, color: Colors.red,),
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red))),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: DropdownButton(
                              hint: Text('Blood Group'),
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 30,
                              isExpanded: true,
                              value: chosenBgroup,
                              onChanged: (newValue){
                                setState(() {
                                  chosenBgroup = newValue;
                                });
                              },
                              items: _bloodgroup.map((valueItem){
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),      
                            ),
                          ),
                          Expanded(
                              child: DropdownButton(
                              hint: Text('gender'),
                              icon: Icon(Icons.arrow_drop_down),
                              iconSize: 30,
                              isExpanded: true,
                              value: chosenGender,
                              onChanged: (newValue){
                                setState(() {
                                  chosenGender = newValue;
                                });
                              },
                              items: _gender.map((valueItem){
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),      
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: addressController,
                        // ignore: missing_return
                        validator: (value) {
                          if (value.trim().isEmpty){
                            return 'Address required';
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.home, color: Colors.red ),
                            labelText: 'ADDRESS ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red))),
                      ),
                      
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: emailController,
                        // ignore: missing_return
                        validator: (value) {
                          if (value.trim().isEmpty){
                            return 'Email required';
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email,color:Colors.red),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red))),
                      ),

                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: passwordController,
                        // ignore: missing_return
                        validator: (value) {
                          if (value.trim().isEmpty){
                            return 'Password required';
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock,color:Colors.red),
                            labelText: 'PASSWORD ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red))),
                        obscureText: true,
                      ),

                      SizedBox(height: 50.0),
                      Text("What type of User are you willing to be?"),
                      DropdownButton(
                        hint: Text('User Type'),
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 30,
                        isExpanded: true,
                        value: chosenType,
                        onChanged: (newValue){
                          setState(() {
                            chosenType = newValue;
                          });
                        },
                        items: _type.map((valueItem){
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),      
                      ),
                      SizedBox(height: 50.0),
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
                                  // _isLoading?Icon(Icons.visibility):
                                  // Icon(Icons.visibility_off);
                                  signup(
                                    nameController.text,
                                    ageController.text,
                                    phoneController.text,
                                    chosenBgroup,
                                    chosenGender,
                                    addressController.text,
                                    emailController.text,
                                    passwordController.text,
                                    chosenType,
                                  );
                                }
                              },
                              child: Center(
                                child: Text(
                                  'SIGNUP',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          )
                        ),
                      errorMsg == null? Container(): Text(
                        "$errorMsg",
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        height: 40.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.0),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: 
                            
                                Center(
                                  child: Text('Go Back',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat')),
                                ),
                            
                            
                          ),
                        ),
                      ),
                    ],
                  )),
            ),

          ]),
        ));
  }

  signup(String name, age, phone, bgroup, gender, address, email, password, type ) async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'name': name,
      'password': password,
      'age':age,
      'phone':phone,
      'user_type':type,
      'gender':gender,
      'bgroup': bgroup,
      'latitude': _currentPosition.latitude,
      'longitude': _currentPosition.longitude,
      'address': address,
      'email': email
    };
    var jsonResponse = null;
    var response = await http.post(Uri.parse("http://10.0.2.2:5000/signup"), 
    headers: {"Content-type":"application/json"},
    body: jsonEncode(data));
    if(response.statusCode == 201) {
      // // jsonResponse = json.decode(response.body);
      print(response.body);
      // if(jsonResponse != null) {
      //   setState(() {
      //     _isLoading = false;
      //   });
      //   // sharedPreferences.setString("token", jsonResponse['data']['token']);
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
      // }
    }
    else {
      setState(() {
        _isLoading = false;
      });
      errorMsg = response.body;
      print("The error message is: ${response.body}");
    }
  }
}