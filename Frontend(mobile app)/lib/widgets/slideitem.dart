import 'package:Ebloodbank/model/slide.dart';
import 'package:flutter/material.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);
  @override
  Widget build(BuildContext context) {
    return
      Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(slideList[index].imageurl), 
                          fit: BoxFit.cover,
                        
                        ),
                      ),
                    ),
                    Text(
                      slideList[index].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30, color: Colors.red),
                    ),
                    SizedBox(height: 10),
                    Text(
                      slideList[index].description,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                );
  }
}