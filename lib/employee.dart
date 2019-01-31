import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Employee 
{

  Employee(this.name, this.startTime, this.endTime);

  String name;
  TimeOfDay startTime;
  TimeOfDay endTime;
  Duration workTime;
  // double tipRate;

  Duration getDifference(TimeOfDay startTime, TimeOfDay endTime)
  {
    DateTime start;
    DateTime end;
    start = new DateTime(startTime.hour, startTime.minute);
    end = new DateTime(endTime.hour, endTime.minute);
    workTime = end.difference(start);
    return workTime;
  }

  String toString()
  {
    String returnString = "\n NAME: ${name}, \n START TIME: ${startTime}, \n END TIME: ${endTime}";
    return returnString;
  }
  
  
}