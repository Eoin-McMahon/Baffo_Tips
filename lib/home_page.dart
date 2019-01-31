import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './employee.dart';
import 'dart:async';
import 'text_field_custom.dart';
import 'globals.dart';

class HomePage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{


  List<Employee> employeeList = [];
  
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

    // if (startPicked != null && startPicked != _time)
    // {
      setState((){
        _startTime = startPicked;
        times.add(startPicked);
        print("Added start time: ${_startTime} to times");
        print("endPicked: " + startPicked.toString());
        print('Start Time: ${_startTime.toString()}');
      });
    // }
    
  }

  Future<Null> _selectEndTime(BuildContext context, _time) async
  {
    final TimeOfDay endPicked = await showTimePicker(
      context: context,
      initialTime: _time
    );

    // if (endPicked != null && endPicked !=_time)
    // {
      setState((){
        _endTime = endPicked;
        times.add(endPicked);
        print("Added end time: ${_endTime} to times");
        print("endPicked: " + endPicked.toString());
        print('End Time: ${_endTime.toString()}');
      });
    // }
    
  }


  @override
  Widget build(BuildContext context) {  
    //TODO: make ipad a global variable to the device is always known throughout the app.
    bool ipad = false;
    final mediaQueryData = MediaQuery.of(context);
    if (mediaQueryData.size >= const Size(768.0,1024.0)) {
      ipad = true;
      print(ipad);

    } 
    else {
    print(ipad);
    print(mediaQueryData.size);
    }
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Baffo Tips", 
          style: TextStyle(fontSize: 30.0,
          color: Colors.white),
        ),),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/geometry-abstract-4k-1y.jpg"),
            fit: BoxFit.cover,
            
          ),
      ),
      child:  TheGridView().build(),
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
                  
                  employees[text] = times;
                  // print(employees.toString());
                  employeeList.add(new Employee(text, times[0], times[1]));
                  for(Employee employee in employeeList)
                  {
                    print(employee.toString());
                  }
                  
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
 

}  

class TheGridView
{
      bool ipad = false; 
         

  Card makeGridCell(String name, String startTime, String endTime)
  {
    return Card(
      shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
      color: Color.fromARGB(230, 255, 255, 255),
      elevation: 3.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          
          Center(
            child: Text(name),
          ),Center(
            child: Text(startTime),
          ),Center(
            child: Text(endTime),
          )
        ],
      ),
    );
  }


  GridView build()
  {
    
    return GridView.count(
      primary: true,
      padding: EdgeInsets.all(20.0),
      crossAxisCount: ipad? 3:2,
      childAspectRatio: 1.0,
      mainAxisSpacing: 20.0,
      crossAxisSpacing: 20.0,
      children: <Widget> [
        makeGridCell("eoin", "16:00", "22:00"),
        makeGridCell("Gaia", "16:00", "22:00"),
        makeGridCell("Will", "16:00", "22:00"),
        makeGridCell("Alisha", "16:00", "22:00"),
        makeGridCell("Geva", "16:00", "22:00"),
        makeGridCell("Geva", "16:00", "22:00"),
        makeGridCell("Geva", "16:00", "22:00"),
        makeGridCell("Geva", "16:00", "22:00"),
        makeGridCell("Geva", "16:00", "22:00"),
        makeGridCell("Geva", "16:00", "22:00"),
        makeGridCell("Geva", "16:00", "22:00"),
        makeGridCell("Geva", "16:00", "22:00"),


      ]

    );
  }
}