import 'package:Ebloodbank/screens/resetpassword.dart';
import 'package:flutter/material.dart';

class ProvidePassword extends StatefulWidget {
  //const ProvidePassword({ Key key }) : super(key: key);

  @override
  _ProvidePasswordState createState() => _ProvidePasswordState();
}

class _ProvidePasswordState extends State<ProvidePassword> {
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: Text('E-BloodBank 🩸',textScaleFactor: 1.1,),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height: 70),

              Text(
                'VERIFICATION',
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
                'Enter the verification code we just send you on your email address',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Codefield(),
                    ),

                    SizedBox(width: 10),

                    Expanded(
                      flex: 3,
                      child: Codefield(),
                    ),

                    SizedBox(width: 10),

                    Expanded(
                      flex: 3,
                      child: Codefield(),
                    ),

                    SizedBox(width: 10),

                    Expanded(
                      flex: 3,
                      child: Codefield(),
                    ),
                  ],
                ),
              ),

              GestureDetector(
                child: RichText(
                  text: TextSpan(
                    text: "If you don't receive a code  ",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.grey
                    ),
                    children: [
                      TextSpan(
                        text: 'Resend',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.blueGrey
                        ),
                      ),
                    ]
                  ),
                ),
                onTap: (){
                  
                },
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
                    'VERIFY',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>Resetpassword()));
                },              
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Codefield extends StatelessWidget {
  const Codefield({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey
                    ),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          style: BorderStyle.solid,
                        ),
                      ),
                      hintText: "0",
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey
                      ), 
                    ),
                  );
  }
}