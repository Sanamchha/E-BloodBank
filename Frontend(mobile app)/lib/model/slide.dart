import 'package:flutter/material.dart';

class Slide{
  final String imageurl;
  final String title;
  final String description;

  Slide({
    @required this.imageurl,
    @required this.title,
    @required this.description,

  });
}

final slideList = [
  Slide(
    imageurl: 'assets/needblood.jpg',
    title: 'NEED BLOOD',
    description: "You can find blood you need",
  ),

  Slide(
    imageurl: 'assets/donors.jpg',
    title: 'DONORS',
    description: "You can help another person give blood",
  ),

  Slide(
    imageurl: 'assets/info.jpg',
    title: 'HEALTHY INFO',
    description: "You can get information about healthy and health community",
  ),
];