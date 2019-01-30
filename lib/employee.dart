import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Employee 
{

  Employee(this.name, this.startTime, this.endTime, this.tipRate);

  String name;
  double startTime;
  double endTime;
  double workTime;
  double tipRate;

  double getWorkTime()
  {
    return endTime - startTime;
  }

  double getEmployeeTips()
  {
    return tipRate * workTime;
  }
  
}