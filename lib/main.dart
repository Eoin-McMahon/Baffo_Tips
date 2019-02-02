import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
    // Define the default Brightness and Colors
    // brightness: Brightness.dark,
    primaryColor: Color.fromARGB(255,30,38,74),
    accentColor: Color.fromARGB(255,30,38,74),
    // Define the default Font Family
    fontFamily: 'Poppins',),
      title: 'Baffo Tips',
      home: HomePage(),
      
    
    );
  } 
}

