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
      
      title: 'Baffo Tips',
      home: HomePage(),
      
    
    );
  } 
}

