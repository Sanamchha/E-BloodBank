import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DonorProfile extends StatefulWidget {
  @override
  _DonorProfileState createState() => _DonorProfileState();
}

class _DonorProfileState extends State<DonorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤵',textScaleFactor: 2,),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Container(
          child: Column(
            children: [
              SizedBox(height:15),
              Container(
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white
                ),
                height: 100,
                child: Center(child: Icon(FontAwesomeIcons.userCircle,size:80,color: Colors.red,),),
              ),
              SizedBox(height: 20),
              Row(
                children:[
                  SizedBox(width: 5,),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      border: Border.all(color: Colors.red[100])
                    ),
                    //height: 35,
                    width: 50,
                    height: 250,
                    child: Center(
                      child: Text(
                        'A+',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(width: 5,),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.red[100])
                    ),
                    height: 250,
                    width: MediaQuery.of(context).size.width-80,

                    child: Stack(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      fit: StackFit.loose,
                      children: [
                        Positioned(  
                          top: 20,
                          left: 10,                     
                          child: RichText(
                            text: TextSpan(
                              text: 
                                'Name: ',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ), 
                              children: [
                                TextSpan(
                                  text: 'Sanam Suwal',
                                )
                              ]
                            )
                          ),
                        ),

                        Positioned(
                          top: 50,
                          left: 10,
                          child: RichText(
                            text: TextSpan(
                              text: 
                                'Address: ',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ), 
                              children: [
                                TextSpan(
                                  text: 'Suraybinayak,8',
                                )
                              ]
                            )
                          ),
                        ),

                        Positioned(
                          top: 80,
                          left: 10,
                          child: RichText(
                            text: TextSpan(
                              text: 
                                'Phone: ',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ), 
                              children: [
                                TextSpan(
                                  text: '9843304443',
                                )
                              ]
                            )
                          ),
                        ),

                        Positioned(
                          top: 110,
                          left: 10,
                          child: RichText(
                            text: TextSpan(
                              text: 
                                'Status: ',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ), 
                              children: [
                                TextSpan(
                                  text: 'Donor',
                                )
                              ]
                            )
                          ),
                        ),

                        Positioned(
                          top: 170,
                          left: 10,
                          child: RichText(
                            text: TextSpan(
                              text: 
                                'Email: ',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ), 
                              children: [
                                TextSpan(
                                  text: 'sanam.chha@gmail.com',
                                )
                              ]
                            )
                          ),
                        ), 

                        Positioned(
                          top: 140,
                          left: 10,
                          child: RichText(
                            text: TextSpan(
                              text: 
                                'Address: ',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ), 
                              children: [
                                TextSpan(
                                  text: 'Bhaktapur',
                                )
                              ]
                            )
                          ),
                        ),
                      ] 
                    )
                  ),
                ],
              ),

              SizedBox(height: 40,),

              Container(
                alignment: Alignment.center,
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.redAccent,
                ),
                child:                   
                  GestureDetector(
                    child: Text(
                      "Update",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,       
                    ),
                    onTap: (){
                      // showdialogblock(context);
                    },
                  ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.red[50] ,
          borderRadius: BorderRadius.circular(30),
        ),
        alignment: Alignment.center,
        constraints: BoxConstraints.tightForFinite(),

      ),
    );
  }
}
