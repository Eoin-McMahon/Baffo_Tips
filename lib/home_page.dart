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
    var top = 0.0;

  String totalTips = "Baffo Tips";
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
      // backgroundColor: Color.fromARGB(255, 40, 54, 99),
      backgroundColor: Color.fromARGB(255, 42, 62, 73),

      body: CustomScrollView(

        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            // title: AnimatedOpacity(
            //             duration: Duration(milliseconds: 300),
            //             //opacity: top == 80.0 ? 1.0 : 0.0,
            //             opacity: 1.0,
            //             child: Text(
            //               top.toString(),
            //               style: TextStyle(fontSize: 42.0, color: Colors.white, fontFamily: "Poppins")
            //             )),
            // Text(
            //   "£${totalTips}", style: TextStyle(fontSize: 42.0, color: Colors.white, fontFamily: "Poppins"),),
            pinned: true,
            // floating: true,
            expandedHeight: 205.0,
            flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                // print('constraints=' + constraints.toString());
                top = constraints.biggest.height;
                return FlexibleSpaceBar(
                  title: Text("${totalTips.toString()}", style: TextStyle(fontSize: 28.0, color: Colors.white, fontFamily: "Poppins")),
              background: Image.asset(
                "assets/floorblur.png", 
                fit: BoxFit.fill,
              ),
            );
          }
        )),
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
        list.add(
          CupertinoButton(

            child: Text("Enter Tips", style: TextStyle(fontSize: 28.0),),
            onPressed: (){
        showDialog(
          barrierDismissible: false,
          context: context,
          child: CupertinoAlertDialog(
            title: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(12.0)),                
                Text("Enter Total Tips"),
                Padding(padding: EdgeInsets.all(12.0)),
                Icon(Icons.attach_money),
                Padding(padding: EdgeInsets.all(12.0)),
                MyPrefilledText(),
                Padding(padding: EdgeInsets.all(12.0)),
                
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
                 // Change Total Tips
                 totalTips = "£" + text;

                });
                Navigator.of(context).pop();
              },
              child: Text("Save"),
            )
          ],
            
          )
        );
      } 
            
          )
        );
        
            
          
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
                // Center(
                //   child: Text(" "),
                // ),
                Center(
                  
                  child: Text(name, style: TextStyle(
                    fontSize: 26.0   
                  ),),
                ),
                // Line Separator
                Container(
                  margin: new EdgeInsets.symmetric(vertical: 8.0),
                  height: ipad? 5.0:3.0,
                  width: ipad? 300.0 :175.0,
                  color: Color.fromARGB(180, 175, 247, 147)
                ),
                
                Center(
                  child: Text(startTime.substring(10,15)),
                ),
                Center(
                  child: Text("to"),
                ),
                Center(
                  child: Text(endTime.substring(10,15)),
                ),
                 Container(
                  margin: new EdgeInsets.symmetric(vertical: 8.0),
                  height: ipad? 5.0:3.0,
                  width: ipad? 300.0 :175.0,
                  color: Color.fromARGB(180, 175, 247, 147)
                
                ),
                Center(
                  child: Text("£8.47", style: TextStyle(fontSize: 26.0),),
                ),
            ],
            ),
      
    );

    
  }

}  