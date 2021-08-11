import 'package:flutter/material.dart';

class ABpositive extends StatefulWidget {
  //const Trial1({ Key? key }) : super(key: key);

  @override
  _ABpositiveState createState() => _ABpositiveState();
}

class _ABpositiveState extends State<ABpositive> {

  var dList = [
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select District" , style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.red,
      ),

      body: ListView.builder(
        itemCount: dList.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              showdialogblock(context, dList[index]);
            },
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    child: Container(
                      child: Text(dList[index], style: TextStyle(fontSize: 20),),
                      padding: EdgeInsets.all(15.0),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),      
    );
  }
  
}

showdialogblock(context, dlist){
  return showDialog(
    context: context,
    builder: (context){
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(3),
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    child: Center(child: Text(dlist + "(AB+)", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)),
                    padding: EdgeInsets.all(15.0),
                    color: Colors.red,
                  ),

                SizedBox(height: 7,),

                Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                            child: Container(
                            color: Colors.redAccent,
                            padding: EdgeInsets.all(30.0),
                            child: Icon(
                              Icons.directions,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                          onTap: (){
                            print(dlist);
                          },
                        ),
                      ),
                      
                      SizedBox(width: 2,),

                      Expanded(
                        child: GestureDetector(
                          child: Container(
                          color: Colors.redAccent,
                          padding: EdgeInsets.all(30.0),
                          child: Icon(
                              Icons.search_outlined,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                          onTap: (){
                            print(dlist);
                          },
                        ),
                      ),

                      SizedBox(width: 2,),
                      
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                          color: Colors.redAccent,
                          padding: EdgeInsets.all(30.0),
                          child: Icon(
                              Icons.help_outlined,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                          onTap: (){
                            print(dlist);
                          },
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

