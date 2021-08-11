import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  int limit=20;
  int count=0;
  String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Notifications',textScaleFactor:1.2),
          backgroundColor: Colors.red,
        ),

      //   body: ListView.builder(
      //   itemCount: limit,
      //   itemBuilder: (context, index) {
      //     count++;
      //     return ListTile(
      //       subtitle: Text('$formattedDate'),
      //       isThreeLine: true,
      //       title: Text("this is title of notification user thitf notf notification user thititle of notification us title of notification us titification user thititle of notification us title of notification us tititle of notification us title of notification us title of notification us number $count"),
      //       leading: CircleAvatar(
      //         backgroundColor: Colors.red,
      //         child: Icon(
      //           Icons.favorite,
      //           color: Colors.white,
      //           )
      //         ),
      //     );
      //   },
      // ),


        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Rabindra Pande \n Need urgent blood for heart surgury"),
              subtitle: Text("$formattedDate"),
              leading: CircleAvatar(backgroundColor: Colors.red, child: Icon(
                Icons.favorite,
                color: Colors.white,
                )),
            ),
            SizedBox(height: 10,),
            ListTile(
              title: Text("Kushal Bogati \n Accident case!!! need urgent A+ blood at Bhaktapur Hospital as soon as possible"),
              subtitle: Text("$formattedDate"),
              leading: CircleAvatar(backgroundColor: Colors.red, child: Icon(
                Icons.favorite,
                color: Colors.white,
                )),
            ),
            SizedBox(height: 10,),
            ListTile(
              title: Text("Aswin kumar \n I need blood for the for my Blood cancer treatement"),
              subtitle: Text("$formattedDate"),
              leading: CircleAvatar(backgroundColor: Colors.red, child: Icon(
                Icons.favorite,
                color: Colors.white,
                )),
            ),
            SizedBox(height: 10,),
            ListTile(
              title: Text("Achal Ghimire \n the only thing i want is to save my son. He is only 9. need urgent blood. please....."),
              subtitle: Text("$formattedDate"),
              leading: CircleAvatar(backgroundColor: Colors.red, child: Icon(
                Icons.favorite,
                color: Colors.white,
                )),
            ),
            SizedBox(height: 10,),
            ListTile(
              title: Text("Kumar Awale \n Ragat chaiyo sir, koi help garidinu na.. O- Blood vai ko lagi chako xa. koi contact ma xa vane please Dhulikhel hospital emergency ward ma turuntai aai dinu holla."),
              subtitle: Text("$formattedDate"),
              leading: CircleAvatar(backgroundColor: Colors.red, child: Icon(
                Icons.favorite,
                color: Colors.white,
                )),
            )
          ],
        ),



      ),
    );
  }
}