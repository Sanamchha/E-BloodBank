import 'package:Ebloodbank/login.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Others',textScaleFactor: 1.2,),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.red[100] ,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            constraints: BoxConstraints.tightForFinite(),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Text('⚙',textScaleFactor: 3,),
                SizedBox(height: 40,),

                Container(
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.redAccent,
                    color: Colors.red,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {
                        print("logut pressed");
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                      },
                      child: Center(
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  ),
                ),                                                             
              ],
            ),
          ),
    );
  }
}