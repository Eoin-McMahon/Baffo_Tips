import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './employee.dart';
import 'dart:async';
import 'text_field_custom.dart';


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
  List<TimeOfDay> times = [];

  double totalTime = 0;
  Future<Null> _selectStartTime(BuildContext context, _time) async
  {

    final TimeOfDay startPicked = await showTimePicker(
      context: context,
      initialTime: _time
    );

    if (startPicked != null && startPicked != _time)
    {
      setState((){
        _startTime = startPicked;
        times.add(startPicked);
        print("Added start time: ${_startTime} to times");
        print("endPicked: " + startPicked.toString());
        print('Start Time: ${_startTime.toString()}');
      });
    }
    
  }

  Future<Null> _selectEndTime(BuildContext context, _time) async
  {
    final TimeOfDay endPicked = await showTimePicker(
      context: context,
      initialTime: _time
    );

    if (endPicked != null && endPicked !=_time)
    {
      setState((){
        _endTime = endPicked;
        times.add(endPicked);
        print("Added end time: ${_endTime} to times");
        print("endPicked: " + endPicked.toString());
        print('End Time: ${_endTime.toString()}');
        
      });
    }
    
  }


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
        child: Icon(Icons.person_add),
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
                  Map<String, List<TimeOfDay>> employees = {};
                  print("Got this far");
                  print("Times Selected: ${times.toString()}");
                  print(times);
                  print(text);
                  print(employees);
                  employees[text] = times;
                  print(employees);
                  times.clear();
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
  Duration getDifference(TimeOfDay _start, TimeOfDay _end)
  {
    DateTime start;
    DateTime end;
    start = new DateTime(_start.hour, start.minute);
    end = new DateTime(_end.hour, end.minute);

    return end.difference(start);
  }

}  

