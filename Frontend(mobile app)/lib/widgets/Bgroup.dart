import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BGroup extends StatelessWidget {
  Items item1 = new Items(
    title: "A+",
    route: '/bgroup/a+',
  );

  Items item2 = new Items(
    title: "B+",
    route: '/bgroup/b+',
  );

  Items item3 = new Items(
    title: "O+",
    route: '/bgroup/o+',
  );

  Items item4 = new Items(
    title: "AB+",
    route: '/bgroup/ab+',
  );
  
  Items item5 = new Items(
    title: "AB-",
    route: '/bgroup/ab-',
  );

  Items item6 = new Items(
    title: "O-",
    route: '/bgroup/o-',
  );

  Items item7 = new Items(
    title: "A-",
    route: '/bgroup/a-',
  );

  Items item8 = new Items(
    title: "B-",
    route: '/bgroup/b-',
  );

  @override
  Widget build(BuildContext context) {
    List<Items> mylist = [item1, item2, item3, item4, item5, item6, item7, item8];
        return Flexible(
          child: GridView.count(
            childAspectRatio: 2.0,
              padding: EdgeInsets.only(left: 40, right: 40),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: mylist.map((data) {
            return SizedBox(
              child: InkWell(
                child: Container(
                decoration: BoxDecoration(
                    color: Colors.redAccent, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Text(
                      data.title,
                      style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600)),
                    
                  ],
                ),
              ),
              onTap: (){
                print("button tapped");
                Navigator.pushNamed(context, data.route);
              },
            ),
          );
          }).toList()
          ),
      );
  }
}

class Items {
  String title;
  String route;
  Items({this.title, this.route,});
}