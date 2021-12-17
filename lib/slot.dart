import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Slot extends StatefulWidget {
  final Color c;
  final String t;
  const Slot({Key key, this.c, this.t}) : super(key: key);

  @override
  _SlotState createState() => _SlotState();
}

class _SlotState extends State<Slot> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      width: 170.0,
      color: Colors.transparent,
      child: Container(
          decoration: BoxDecoration(
              color: widget.c,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: new Center(
            child: new Text(widget.t,
              style: TextStyle(color: Colors.white, fontSize: 22),
              textAlign: TextAlign.center,),
          )),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

}

