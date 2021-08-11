import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
    title: "FIND A DONOR",
    img: "assets/find-donor.jpg",
    route: '/map',
  );

  Items item2 = new Items(
    title: "BLOOD BANK",
    img: "assets/donors.jpg",
    route: '/donors',
  );

  Items item3 = new Items(
    title: "REQUESTS",
    img: "assets/request.jpg",
    route: '/requests',
  );

  Items item4 = new Items(
    title: "OTHER",
    img: "assets/other.png",
    route: '/settings',
  );

  @override
  Widget build(BuildContext context) {
    List<Items> mylist = [item1, item2, item3, item4];
        return Flexible(
          child: GridView.count(
            childAspectRatio: 1.0,
              padding: EdgeInsets.only(left: 16, right: 16),
              crossAxisCount: 2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              children: mylist.map((data) {
            return SizedBox(
              child: InkWell(
                child: Container(
                decoration: BoxDecoration(
                    color: Colors.white24, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img,
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.title,
                      style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 8,
                    ),
                    
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
  String img;
  String route;
  Items({this.title, this.img, this.route,});
}