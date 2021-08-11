import 'package:flutter/material.dart';
import 'package:Ebloodbank/screens/appbar.dart';
import 'package:Ebloodbank/screens/griddashboard.dart';

class HomePage extends StatefulWidget {
  //const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        
        preferredSize: Size.fromHeight(200),
        child: ClipPath(clipper: CustomAppBar(),
          child: 
            Container(color: Colors.red, child: Center(child: 
              Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                Text("GIVE THE GIFT OF LIFE", style: TextStyle(fontSize: 20, color: Colors.white,),),
                Text("DONATE BLOOD", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold,),),
              ],)),   
            ),
        ),
      ),

      body:       
        Column(
          children: <Widget>[
            GridDashboard()
          ],
        ),
      
    );
  }
}