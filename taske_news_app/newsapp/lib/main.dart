import 'package:flutter/material.dart';
import 'package:newsapp/home.dart';
import 'package:newsapp/splash_screen.dart';
import 'package:newsapp/widgets/category.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
   
    body:   SafeArea(child:page()),
      ),
    );
  }
}


