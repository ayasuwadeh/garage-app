import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Helper extends StatefulWidget {
  final Color color;
  const Helper({Key key, this.color}) : super(key: key);

  @override
  _HelperState createState() => _HelperState();
}

class _HelperState extends State<Helper> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 9.0,
      width: 9.0,
      color: Colors.transparent,
      child: Container(
          decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.all(Radius.circular(2.0))),

    ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

}

