import 'package:flutter/material.dart';
import 'package:Ebloodbank/screens/dashboard.dart';

class addRequest extends StatefulWidget {
  @override
  _addRequestState createState() => _addRequestState();
}

class _addRequestState extends State<addRequest> {

  final formkey = GlobalKey<FormState>();

  List _bloodgroup = ['A+','A-','B+','B-','AB+','AB-','O+','O-'];
  String valuechoose1;
  List _requiredblood = ['1 bag','2 bags','3 bags','4 bags','5 bags'];
  String valuechoose2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request for Blood',textScaleFactor: 1.1,),
        centerTitle: true,
        backgroundColor: Colors.red,        
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formkey,
          child: Column(children: <Widget>[

            Text('🩸',textScaleFactor: 3,),
            TextFormField(
              decoration: InputDecoration(labelText: 'Full Name',),
              // ignore: missing_return
              validator: (value) {
                if (value.trim().isEmpty){
                  return 'Fullname required';
                }
              },
            ),

            DropdownButton(
                hint: Text('Required Blood Group'),
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 30,
                isExpanded: true,
                value: valuechoose1,
                onChanged: (newValue){
                  setState(() {
                    valuechoose1 = newValue;
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
                hint: Text('Required Amount of Blood'),
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 30,
                isExpanded: true,
                value: valuechoose2,
                onChanged: (newValue){
                  setState(() {
                    valuechoose2 = newValue;
                  });
                },
                items: _requiredblood.map((valueItem){
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList(),      
              ),

            TextFormField(
              decoration: InputDecoration(labelText: 'Mobile Number'),
              keyboardType: TextInputType.phone,
              // ignore: missing_return
              validator: (value) {
                if (value.trim().isEmpty){
                  return 'Mobile number required';
                }
              },
            ),

            TextFormField(
              decoration: InputDecoration(labelText: 'Date (3/16/2021)'),
              keyboardType: TextInputType.datetime,
              // ignore: missing_return
              validator: (value) {
                if (value.trim().isEmpty){
                  return 'Date required';
                }
              },
            ),

            TextFormField(
              decoration: InputDecoration(labelText: 'Name of hospital (Address ? Ward No ? Bed No ?)'),
              // ignore: missing_return
              validator: (value) {
                if (value.trim().isEmpty){
                  return 'Field required';
                }
              },
            ),

            TextFormField(
              decoration: InputDecoration(labelText: 'Why do you need blood?'),
              // ignore: missing_return
              validator: (value) {
                if (value.trim().isEmpty){
                  return 'Field required';
                }
              },
            ),

            SizedBox(height: 25,),

            // ignore: deprecated_member_use
            RaisedButton(
              onPressed: (){
                if(formkey.currentState.validate()){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()
                  ));
                }
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Text('Submit',textScaleFactor: 1.5,),
              textColor: Colors.white,
              color: Colors.redAccent,
            ),

          ]),
          ),
      ),

    );
  }
}