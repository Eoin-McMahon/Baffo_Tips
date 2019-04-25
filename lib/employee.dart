import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Employee 
{

  Employee(this.name, this.startTime, this.endTime);

  String name;
  TimeOfDay startTime;
  TimeOfDay endTime;
  Duration workTime;
  double tips = 0.00;

  Duraton getDifference(TimeOfDay startTime, TimeOfDay endTime)
  {
    DateTime start;
    DateTime end;
    start = new DateTime(startTime.hour, startTime.minute);
    end = new DateTime(endTime.hour, endTime.minute);
    workTime = end.difference(start);
    return workTime;
  }

  double getTips()
  {
    return tips;  
  }
  String toString()
  {
    String returnString = "\n NAME: ${name}, \n START TIME: ${startTime}, \n END TIME: ${endTime}";
    return returnString;
  }

  String getName()
  {
    return name;
  }

  TimeOfDay getStartTime()
  {
    return startTime;
  }
  TimeOfDay getEndTime()
  {
    return endTime;
  }
  
  
}