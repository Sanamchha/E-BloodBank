import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DonorProfile extends StatefulWidget {
  @override
  _DonorProfileState createState() => _DonorProfileState();
}

class _DonorProfileState extends State<DonorProfile> {
  List _bloodgroup = ['A+','A-','B+','B-','AB+','AB-','O+','O-'];
  String valuechoose1;
  List _status = ['Ready to Donate','Last donated 3 months ago','Last donated 2 months ago','Last donated 1 month ago',"Can't Donate Now"];
  String valuechoose3;
  List _district = [
    "Achham",
    "Arghakhanchi",
    "Baglung",
    "Baitadi",
    "Bajhang",
    "Bajura",
    "Banke",
    "Bara",
    "Bardiya",
    "Bhaktapur",
    "Bhojpur",
    "Chitwan",
    "Dadeldhura",
    "Dailekh",
    "Dang deukhuri",
    "Darchula",
    "Dhading",
    "Dhankuta",
    "Dhanusa",
    "Dholkha",
    "Dolpa",
    "Doti",
    "Gorkha",
    "Gulmi",
    "Jumla",
    "Ilam",
    "Jajarkot",
    "Jhapa",
    "Jumla",
    "Kailali",
    "Kalikot",
    "Kanchanpur",
    "Kapilvastu",
    "Kaski",
    "Kathmandu",
    "Kavrepalanchok",
    "Khotang",
    "Lalitpur",
    "Lamjung",
    "Mahottari",
    "Makwanpur",
    "Manang",
    "Morang",
    "Mugu",
    "Mustang",
    "Myagdi",
    "Nawalparasi",
    "Nuwakot",
    "Okhaldhunga",
    "Palpa",
    "Panchthar",
    "Parbat",
    "Parsa",
    "Pyuthan",
    "Ramechhap",
    "Rasuwa",
    "Rautahat",
    "Rolpa",
    "Rukum",
    "Rupandehi",
    "Salyan",
    "Sankhuwasabha",
    "Saptari",
    "Sarlahi",
    "Sindhuli",
    "Sindhupalchok",
    "Siraha",
    "Solukhumbu",
    "Sunsari",
    "Surkhet",
    "Syangja",
    "Tanahu",
    "Taplejung",
    "Terhathum",
    "Udayapur"
  ];
  String valuechoose2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(5, 80, 5, 20),
          height: 620,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                height: 150,
                color: Colors.red,
                child: Center(
                  child: Icon(
                    FontAwesomeIcons.userCircle,
                    size: 100,
                    color: Colors.white,                  
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      //borderRadius: BorderRadius.circular(5),
                      color: Colors.transparent,
                      border: Border.all(color: Colors.grey)
                    ),
                    //height: 35,
                    width: 50,
                    height: 200,
                    child: Center(
                      child: Text(
                        'A-',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),


                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.transparent,
                      border: Border.all(color: Colors.grey)
                    ),
                    height: 200,
                    width: MediaQuery.of(context).size.width-60,

                    child: Stack(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      fit: StackFit.loose,
                      children: [
                        Positioned(  
                          top: 0,
                          left: 10,                     
                          child: RichText(
                            text: TextSpan(
                              text: 
                                'Name: ',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ), 
                              children: [
                                TextSpan(
                                  text: '',
                                )
                              ]
                            )
                          ),
                        ),
                        
                        //SizedBox(height: 10,),
                        Positioned(
                          top: 30,
                          left: 10,
                          child: RichText(
                            text: TextSpan(
                              text: 
                                'Address: ',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ), 
                              children: [
                                TextSpan(
                                  text: '',
                                )
                              ]
                            )
                          ),
                        ),

                        //SizedBox(height: 10,),

                        Positioned(
                          top: 60,
                          left: 10,
                          child: RichText(
                            text: TextSpan(
                              text: 
                                'District: ',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ), 
                              children: [
                                TextSpan(
                                  text: '',
                                )
                              ]
                            )
                          ),
                        ),

                        //SizedBox(height: 10,),

                        Positioned(
                          top: 90,
                          left: 10,
                          child: RichText(
                            text: TextSpan(
                              text: 
                                'Status: ',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ), 
                              children: [
                                TextSpan(
                                  text: '',
                                )
                              ]
                            )
                          ),
                        ),

                        //SizedBox(height: 10,),

                        Positioned(
                          top: 120,
                          left: 10,
                          child: RichText(
                            text: TextSpan(
                              text: 
                                'Phone: ',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ), 
                              children: [
                                TextSpan(
                                  text: '',
                                )
                              ]
                            )
                          ),
                        ),                                            
                      ],
                    ),

                  ),
                ],
              ),

              SizedBox(height: 50,),
              Container(
                alignment: Alignment.center,
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.redAccent,
                ),
                child:                   
                  GestureDetector(
                    child: Text(
                      "Update",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
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
      ),
    );
  }

showdialogblock(BuildContext context){
  return showDialog(
    context: context,
    builder: (context){
      return Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            height: MediaQuery.of(context).size.height,

            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
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

                TextField(
                    decoration: InputDecoration(
                      labelText: 'Contact',
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

                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Address',
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

                  DropdownButton(
                  hint: Text('Select District'),
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 30,
                  isExpanded: true,
                  value: valuechoose2,
                  onChanged: (newValue){
                    setState(() {
                      valuechoose2 = newValue;
                    });
                  },
                  items: _district.map((valueItem){
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),      
                ),

                DropdownButton(
                  hint: Text('Select Blood Group'),
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 30,
                  isExpanded: true,
                  value: valuechoose1,
                  onChanged: (newValue){
                    setState(() {
                      valuechoose2 = newValue;
                    });
                  },
                  items: _bloodgroup.map((valueItem){
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),      
                ),

                DropdownButton(
                  hint: Text('Select Status'),
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 30,
                  isExpanded: true,
                  value: valuechoose3,
                  onChanged: (newValue){
                    setState(() {
                      valuechoose2 = newValue;
                    });
                  },
                  items: _status.map((valueItem){
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),      
                ),

                Row(
                  children: [
                    Expanded(
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        onPressed: (){}, 
                        child: Text('BACK'),
                        color: Colors.blue,
                      ),
                    ),

                    Expanded(
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        onPressed: (){}, 
                        child: Text('UPDATE'),
                        color: Colors.red,
                      ),
                    ),

                    Expanded(
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        onPressed: (){}, 
                        child: Text('DELETE'),
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      );
    }
  );
}
}