import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './employee.dart';
import 'dart:async';

String text = '';
String placeholder = '';
class MyPrefilledText extends StatefulWidget {
  @override
  _MyPrefilledTextState createState() => _MyPrefilledTextState();
}

class _MyPrefilledTextState extends State<MyPrefilledText> {

  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      // style: TextStyle(color: Colors.blue),
      controller: _textController,
      placeholder: "employee name", 
      onChanged: (String e) {
        setState(() {
          text = e;
          print(e);
        });
      },
    );
  }
}