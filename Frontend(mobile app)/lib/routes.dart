import 'package:Ebloodbank/screens/Bgroups/a_neg.dart';
import 'package:Ebloodbank/screens/donors.dart';
import 'package:Ebloodbank/screens/feed.dart';
import 'package:Ebloodbank/screens/settings.dart';
import 'package:flutter/material.dart';
import 'map.dart';
import 'package:Ebloodbank/screens/sliderpage.dart';
import 'login.dart';
// import 'signup.dart';
// import 'screens/dashboard.dart';
// import 'screens/griddashboard.dart';

Map<String, Function> routes = <String, Function>{
  '/map': () => PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation){
      return MapSample();
    },),

  '/donors': () => PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation){
      return Bloodbank();
    },),

  '/settings': () => PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation){
      return Settings();
    },),

  '/slider':() => PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation){
      return SliderPage();
    }),

  '/login':() => PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation){
      return LoginPage();
    }),  

  '/requests':() => PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation){
      return Feed();
    }),

  '/bgroup/a+':() => PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation){
      return Anegative();
    }),  

  '/bgroup/b+':() => PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation){
      return LoginPage();
    }),  

  '/bgroup/ab+':() => PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation){
      return LoginPage();
    }),  

  '/bgroup/o+':() => PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation){
      return LoginPage();
    }),  

  '/bgroup/a-':() => PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation){
      return Anegative();
    }),  

  '/bgroup/ab-':() => PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation){
      return LoginPage();
    }),  

  '/bgroup/b-':() => PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation){
      return LoginPage();
    }),  

  '/bgroup/o-':() => PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation){
      return LoginPage();
    }),  



};

