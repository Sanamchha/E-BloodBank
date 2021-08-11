import 'package:flutter/material.dart';
import 'package:Ebloodbank/screens/Bloodgroups/a_neg.dart';
import 'package:Ebloodbank/screens/Bloodgroups/a_pos.dart';
import 'package:Ebloodbank/screens/Bloodgroups/ab_neg.dart';
import 'package:Ebloodbank/screens/Bloodgroups/ab_pos.dart';
import 'package:Ebloodbank/screens/Bloodgroups/b_neg.dart';
import 'package:Ebloodbank/screens/Bloodgroups/b_pos.dart';
import 'package:Ebloodbank/screens/Bloodgroups/o_neg.dart';
import 'package:Ebloodbank/screens/Bloodgroups/o_pos.dart';

class SearchByBlood extends StatefulWidget {
  @override
  _SearchByBloodState createState() => _SearchByBloodState();
}

class _SearchByBloodState extends State<SearchByBlood> {
  bool opened = false;
  String valuechoose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donors Search',textScaleFactor: 1.1,),
        centerTitle: true,
        backgroundColor: Colors.red,       
      ),

      body: Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            left: opened
              ? MediaQuery.of(context).size.width /2.5
              : MediaQuery.of(context).size.width / 9,
            top: opened
              ? MediaQuery.of(context).size.height / 2.7
              : MediaQuery.of(context).size.height / 2 ,
            child: _buildOption(
              // ignore: deprecated_member_use
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Text("A+", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
                color: Colors.green,
                textColor: Colors.white,
                highlightColor: Colors.yellow,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Apositive()
                    ));
                },
              ),
            ),
          ), 

          AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              left: opened
                ? MediaQuery.of(context).size.width /2.5
                : MediaQuery.of(context).size.width / 15,
              top: opened
                ? MediaQuery.of(context).size.height / 2.7
                : MediaQuery.of(context).size.height / 2.7  ,
              child: _buildOption(
                // ignore: deprecated_member_use
                RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Text("A-",style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
                    color: Colors.lightGreen,
                    textColor: Colors.white,
                    highlightColor: Colors.yellow,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Anegative()
                      ));
                    },
                  ), 
              ),
          ),

          AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              left: opened
                ? MediaQuery.of(context).size.width /2.5
                : MediaQuery.of(context).size.width / 1.5,
              top: opened
                ? MediaQuery.of(context).size.height / 2.7
                : MediaQuery.of(context).size.height / 4.2 ,
              child: _buildOption(
                // ignore: deprecated_member_use
                RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Text("O-",style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
                    color: Colors.redAccent,
                    textColor: Colors.white,
                    highlightColor: Colors.yellow,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Onegative()
                      ));
                    },
                  ),
              ),
          ),

          AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              left: opened
                ? MediaQuery.of(context).size.width /2.5
                : MediaQuery.of(context).size.width / 2.6,
              top: opened
                ? MediaQuery.of(context).size.height / 2.7
                : MediaQuery.of(context).size.height / 7 ,
              
              child: _buildOption(
                // ignore: deprecated_member_use
                RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Text("AB+",style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
                    color: Colors.orange,
                    textColor: Colors.white,
                    highlightColor: Colors.yellow,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ABpositive()
                      ));
                    },
                  ),
              ),
          ),

          AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              left: opened
                ? MediaQuery.of(context).size.width /2.5
                : MediaQuery.of(context).size.width / 9,
              top: opened
                ? MediaQuery.of(context).size.height / 2.7
                : MediaQuery.of(context).size.height / 4.2 ,
              child: _buildOption(
                // ignore: deprecated_member_use
                RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Text("AB-",style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
                    color: Colors.orangeAccent,
                    textColor: Colors.white,
                    highlightColor: Colors.yellow,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ABnegative()
                      ));
                    },
                  ),
              ),
          ),

          AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              left: opened
                ? MediaQuery.of(context).size.width /2.5
                : MediaQuery.of(context).size.width / 2.6,
              top: opened
                ? MediaQuery.of(context).size.height / 2.7
                : MediaQuery.of(context).size.height / 1.7 ,
              child: _buildOption(
                // ignore: deprecated_member_use
                RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Text("B+",style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
                    color: Colors.purple,
                    textColor: Colors.white,
                    highlightColor: Colors.yellow,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Bpositive()
                      ));
                    },
                  ),
              ),
          ),

          AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              left: opened
                ? MediaQuery.of(context).size.width /2.5
                : MediaQuery.of(context).size.width / 1.5,
              top: opened
                ? MediaQuery.of(context).size.height / 2.7
                : MediaQuery.of(context).size.height / 2 ,
              child: _buildOption(
                // ignore: deprecated_member_use
                RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Text("B-",style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
                    color: Colors.purpleAccent,
                    textColor: Colors.white,
                    highlightColor: Colors.yellow,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Bnegative()
                      ));
                    },
                  ),
              ),
          ),

          AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              left: opened
                ? MediaQuery.of(context).size.width /2.5
                : MediaQuery.of(context).size.width / 1.4,
              top: opened
                ? MediaQuery.of(context).size.height / 2.7
                : MediaQuery.of(context).size.height / 2.7 ,
              child: _buildOption(
                // ignore: deprecated_member_use
                RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Text("O+",style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
                    color: Colors.red,
                    textColor: Colors.white,
                    highlightColor: Colors.yellow,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Opositive()
                      ));
                    },
                  ),
              ),
          ),

        
          Align(
            // alignment: Alignment.center,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 100),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(child: child, scale: animation);
              },
              child: opened
                  ? InkWell(
                      key: UniqueKey(),
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                              height: 100.0,
                              width: 110.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  color: Colors.red),
                              child: Center(
                                  child: Icon(Icons.home, color: Colors.white, size: 60.0,)))),
                      onTap: () {
                        setState(() {
                          opened = false;
                        });
                      }
                    )
                  : InkWell(
                      key: UniqueKey(),
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40.0),
                                  color: Colors.red[200]),
                              child: Center(
                                  child:
                                      Icon(Icons.close, color: Colors.white)))),
                      onTap: () {
                        setState(() {
                          opened = true;
                        });
                      }),
            ),
          )
        ],
      )
    );
  }


// ignore: deprecated_member_use
  Widget _buildOption(RaisedButton icon) {
    return AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return RotationTransition(child: child, turns: animation);
        },
        child: Center(child: icon));
  }
 
}