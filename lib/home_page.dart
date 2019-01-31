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

  Map<String, List<TimeOfDay>> employees = {};
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
      // appBar: AppBar(
      //   title: Center(
      //     child: Text("Baffo Tips", 
      //     style: TextStyle(fontSize: 30.0,
      //     color: Colors.white),
      //   ),),
      // ),
      body: CustomScrollView(

        slivers: <Widget>[
          SliverAppBar(
            title: Text("Baffo Tips",),
            pinned: true,
            expandedHeight: 205.0,
            flexibleSpace: FlexibleSpaceBar(
              
              background: Image.asset("assets/sliverimage.jpg"),
              
            ),
          ),
          SliverGrid.count(

            crossAxisCount: 2,
            children: ListMyWidgets(employeeList)

          )
        ]
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
                  
                  employees[text] = times;
                  // print(employees.toString());
                  employeeList.add(new Employee(text, times[0], times[1]));
                  for(Employee employee in employeeList)
                  {
                    print(employee.toString());
                  }
                  print(employees.toString());
                  // TheGridView().build(employeeList);
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
    ,)      
    );
  }
  List<Widget> ListMyWidgets(List<Employee> employees) {
        
        List<Widget> list = new List();

        for(Employee employee in employees)
        {
          String name = employee.getName();
          String start = employee.getStartTime().toString();
          String end = employee.getEndTime().toString();
          list.add(makeGridCell(name, start,end));
        }

        
        return list;
  
    }
 Container makeGridCell(String name, String startTime, String endTime)
  {
    return Container(
      height: 300.0,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(250, 255, 255, 255),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: <BoxShadow>
        [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0)
          )
        ]
      ),
      child: Column(
              
              children: <Widget>[
                Center(
                  child: Text(" "),
                ),
                Center(
                  
                  child: Text(name, style: TextStyle(
                    fontSize: 26.0   
                  ),),
                ),
                // Line Separator
                Container(
                  margin: new EdgeInsets.symmetric(vertical: 8.0),
                  height: ipad? 5.0:3.0,
                  width: ipad? 300.0 :110.0,
                  color: new Color(0xff00c6ff)
                ),
                
                Center(
                  child: Text(startTime.substring(10,15)),
                ),
                Center(
                  child: Text("to"),
                ),
                Center(
                  child: Text(endTime.substring(10,15)),
                )
            ],
            ),
      
    );

    
  }

}  