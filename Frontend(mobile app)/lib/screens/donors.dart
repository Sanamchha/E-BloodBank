//might be usefult for posting requests

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bloodbank extends StatefulWidget {
  @override
  _BloodbankState createState() => _BloodbankState();
}

class _BloodbankState extends State<Bloodbank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BloodBanks',textScaleFactor: 1.2,),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.red[100] ,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            constraints: BoxConstraints.tightForFinite(height: 160),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    Icon(FontAwesomeIcons.ambulance, size: 25,),
                    SizedBox(width: 30,),
                    Text('Bhaktapur hospital',textScaleFactor: 1.2,),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    Icon(FontAwesomeIcons.user, size: 25,),
                    SizedBox(width: 30,),
                    Text('Office Staff',textScaleFactor: 1.2,),
                    SizedBox(width: 150,),
                    GestureDetector(
                      child: Icon(FontAwesomeIcons.phone,color: Colors.red,size: 35,),
                      onTap: (){

                      },
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    Icon(FontAwesomeIcons.phone, size: 25,),
                    SizedBox(width: 30,),
                    Text('+977-9843665213',textScaleFactor: 1.2,),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    Icon(FontAwesomeIcons.mapMarked, size: 25,),
                    SizedBox(width: 30,),
                    Text('Dudhpati, Bhaktapur',textScaleFactor: 1.2,),
                  ],
                ),                                                             
              ],
            ),
          ),

// repeat starts here
          // SizedBox(height: 0,),
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.red[100] ,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            constraints: BoxConstraints.tightForFinite(height: 160),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    Icon(FontAwesomeIcons.ambulance, size: 25,),
                    SizedBox(width: 30,),
                    Text('Bhaktapur Blood Bank,NRCS',textScaleFactor: 1.2,),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    Icon(FontAwesomeIcons.user, size: 25,),
                    SizedBox(width: 30,),
                    Text('Official Staff',textScaleFactor: 1.2,),
                    SizedBox(width: 150,),
                    GestureDetector(
                      child: Icon(FontAwesomeIcons.phone,color: Colors.red,size: 35,),
                      onTap: (){

                      },
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    Icon(FontAwesomeIcons.phone, size: 25,),
                    SizedBox(width: 30,),
                    Text('+977-01-6620001',textScaleFactor: 1.2,),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    Icon(FontAwesomeIcons.mapMarked, size: 25,),
                    SizedBox(width: 30,),
                    Text('Dudhpati, Bhaktapur',textScaleFactor: 1.2,),
                  ],
                ),                                                             
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.red[100] ,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            constraints: BoxConstraints.tightForFinite(height: 160),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    Icon(FontAwesomeIcons.ambulance, size: 25,),
                    SizedBox(width: 30,),
                    Text('Central Transfusion Center, NRCS',textScaleFactor: 1.2,),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    Icon(FontAwesomeIcons.user, size: 25,),
                    SizedBox(width: 30,),
                    Text('Office Staff',textScaleFactor: 1.2,),
                    SizedBox(width: 150,),
                    GestureDetector(
                      child: Icon(FontAwesomeIcons.phone,color: Colors.red,size: 35,),
                      onTap: (){

                      },
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    Icon(FontAwesomeIcons.phone, size: 25,),
                    SizedBox(width: 30,),
                    Text('01-4288485/01-4288488',textScaleFactor: 1.2,),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    Icon(FontAwesomeIcons.mapMarked, size: 25,),
                    SizedBox(width: 30,),
                    Text('Soltimode,Kalimati',textScaleFactor: 1.2,),
                  ],
                ),                                                             
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.red[100] ,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            constraints: BoxConstraints.tightForFinite(height: 180),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    Icon(FontAwesomeIcons.ambulance, size: 25,),
                    SizedBox(width: 30,),
                    Text('Maternity & Woman Hospital \n Blood Bank',textScaleFactor: 1.2, overflow: TextOverflow.ellipsis,maxLines: 2,),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    Icon(FontAwesomeIcons.user, size: 25,),
                    SizedBox(width: 30,),
                    Text('Office Staff',textScaleFactor: 1.2,),
                    SizedBox(width: 150,),
                    GestureDetector(
                      child: Icon(FontAwesomeIcons.phone,color: Colors.red,size: 35,),
                      onTap: (){

                      },
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    Icon(FontAwesomeIcons.phone, size: 25,),
                    SizedBox(width: 30,),
                    Text('01-4280405',textScaleFactor: 1.2,),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    Icon(FontAwesomeIcons.mapMarked, size: 25,),
                    SizedBox(width: 30,),
                    Text('Thapathali, Kathmandu',textScaleFactor: 1.2,),
                  ],
                ),                                                             
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.red[100] ,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            constraints: BoxConstraints.tightForFinite(height: 160),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    Icon(FontAwesomeIcons.ambulance, size: 25,),
                    SizedBox(width: 30,),
                    Text('Nobel Hospital Blood Bank',textScaleFactor: 1.2,),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    Icon(FontAwesomeIcons.user, size: 25,),
                    SizedBox(width: 30,),
                    Text('Office Staff',textScaleFactor: 1.2,),
                    SizedBox(width: 150,),
                    GestureDetector(
                      child: Icon(FontAwesomeIcons.phone,color: Colors.red,size: 35,),
                      onTap: (){

                      },
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    Icon(FontAwesomeIcons.phone, size: 25,),
                    SizedBox(width: 30,),
                    Text('01-4110842',textScaleFactor: 1.2,),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 30,),
                    Icon(FontAwesomeIcons.mapMarked, size: 25,),
                    SizedBox(width: 30,),
                    Text('Sinamangal,kathmandu',textScaleFactor: 1.2,),
                  ],
                ),                                                             
              ],
            ),
          ),



        ],
      ),
    );
  }
}