// import 'package:Ebloodbank/screens/appbar.dart';
import 'package:flutter/material.dart';
import 'package:Ebloodbank/screens/add.dart';
import 'package:Ebloodbank/screens/homepage.dart';
import 'package:Ebloodbank/screens/notifications.dart';
import 'package:Ebloodbank/screens/profile.dart';
import 'package:Ebloodbank/screens/searchbyblood.dart';

// import 'griddashboard.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int _currentIndex = 0;
  final List<Widget> bbitems = [
    HomePage(),
    SearchByBlood(),
    addRequest(),
    Notifications(),
    DonorProfile(),
  ];

  void onTappedBar(int index){
    setState(() {
      _currentIndex = index;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // body: Column(
      //   children: <Widget>[
      //     GridDashboard()
      //   ],
      // ),

      body: bbitems[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            // ignore: deprecated_member_use
            title: Text('Home'),
            backgroundColor: Colors.grey,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            // ignore: deprecated_member_use
            title: Text('Search'),
            backgroundColor: Colors.grey,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            // ignore: deprecated_member_use
            title: Text('Add'),
            backgroundColor: Colors.grey,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            // ignore: deprecated_member_use
            title: Text('Notification'),
            backgroundColor: Colors.grey,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            // ignore: deprecated_member_use
            title: Text('Profile'),
            backgroundColor: Colors.grey,
          ),

          
        ],
        onTap: onTappedBar,
      ),
    );
  }
}