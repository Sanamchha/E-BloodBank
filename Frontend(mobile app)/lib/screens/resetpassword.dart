import 'package:Ebloodbank/login.dart';
import 'package:flutter/material.dart';

class Resetpassword extends StatefulWidget {
  const Resetpassword({ Key key }) : super(key: key);

  @override
  _ResetpasswordState createState() => _ResetpasswordState();
}

class _ResetpasswordState extends State<Resetpassword> {
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
              "RESET PASSWORD", 
              style: TextStyle(
                fontSize: 30.0, 
                fontWeight: FontWeight.bold, 
                color: Colors.redAccent,
                fontFamily: 'Montserrat',
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20,),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 50,),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Enter a new Password',
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

            SizedBox(height: 10,),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 50,),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Re-Enter a new Password',
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
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.redAccent,
                ),
                child: Text(
                  'CONFIRM',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
              },              
            ),

          ],
        ),
      ),
    );
  }
}