import 'dart:convert';

import 'package:flutter/material.dart';

class Status {
  List<int> state = new List(6);
  Status();

  void splitData(String s){
   List<String>statuses=s.split(',');
   state[0]=int.parse(statuses[0]);
   // print("s0"+s0.toString());
   state[1]=int.parse(statuses[1]);
  // print("s1"+s1.toString());
   state[2]=int.parse(statuses[2]);
 //  print("s2"+s2.toString());
   state[3]=int.parse(statuses[3]);
 //  print("s3"+s3.toString());
   state[4]=int.parse(statuses[4]);
 //  print("s4"+s4.toString());
   state[5]=int.parse(statuses[5]);
//   print("s5"+s5.toString());

  }
 @override
  String toString() {
    // TODO: implement toString
    return state[0].toString()+','+state[1].toString()+','+state[2].toString()
        +','+state[3].toString()+','+state[4].toString()+','+state[5].toString();
  }
}
