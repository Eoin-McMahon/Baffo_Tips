import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './employee.dart';
import 'dart:async';


class HomePage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  TimeOfDay _time = new TimeOfDay.now();
  TimeOfDay _startTime = new TimeOfDay.now();
  TimeOfDay _endTime = new TimeOfDay.now();


  Future<Null> _selectStartTime(BuildContext context, _time) async
  {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _time
    );

    if (picked != null && picked != _time)
    {
      setState((){
        _startTime = picked;
        employees.add(_startTime.toString());

        print('Start Time: ${_startTime.toString()}');
      });
    }
    
  }
  Future<Null> _selectEndTime(BuildContext context, _time) async
  {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _time
    );

    if (picked != null && picked !=_time)
    {
      setState((){
        _endTime = picked;
        employees.add(_endTime.toString());

        print('End Time: ${_endTime.toString()}');
        print(employees.toString());
      });
    }
    
  }


  List<String> employees = [];
  @override
  Widget build(BuildContext context) {      
    return Scaffold(
      appBar: AppBar(
        title: Text("Baffo Tips", 
        style: TextStyle(
          color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      onPressed: (){
        showDialog(
          barrierDismissible: false,
          context: context,
          child: CupertinoAlertDialog(
            title: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(12.0)),                
                Text("Add an employee"),
                Padding(padding: EdgeInsets.all(12.0)),
                Icon(Icons.person_add),
                Padding(padding: EdgeInsets.all(12.0)),
                MyPrefilledText(),
                Padding(padding: EdgeInsets.all(12.0)),
                CupertinoButton(
                  child: Text("Start time"),
                  onPressed: (){_selectStartTime(context, _time);},
                  color: Colors.blue,
                ),
                Padding(padding: EdgeInsets.all(12.0)),
                CupertinoButton(
                  child: Text("End time"),
                  onPressed: (){_selectEndTime(context, _time);},
                  color: Colors.blue,


                )
                // TimePicker(),
              ],
            ),
           
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  employees.add(text);
                  print(employees);
                });
                Navigator.of(context).pop();
              },
              child: Text("Save"),
            )
          ],
            
          )
        );
      } 
    ,),      
    );
  }

}  
String text = '';




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
