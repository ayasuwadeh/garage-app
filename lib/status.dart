import 'dart:convert';

import 'package:flutter/material.dart';

class Status {
  int s0;
  int s1;
  int s2;
  int s3;
  int s4;
  int s5;

  Status();

  void splitData(String s){
   List<String>statuses=s.split(',');
   s0=int.parse(statuses[0]);
   print("s0"+s0.toString());
   s1=int.parse(statuses[1]);
   print("s1"+s1.toString());
   s2=int.parse(statuses[2]);
   print("s2"+s2.toString());
   s3=int.parse(statuses[3]);
   print("s3"+s3.toString());
   s4=int.parse(statuses[4]);
   print("s4"+s4.toString());
   s5=int.parse(statuses[5]);
   print("s5"+s5.toString());

  }
 @override
  String toString() {
    // TODO: implement toString
    return s0.toString()+','+s1.toString()+','+s2.toString()
        +','+s3.toString()+','+s4.toString()+','+s5.toString();
  }
}
