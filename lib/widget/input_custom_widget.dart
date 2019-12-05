import 'package:flutter/material.dart';

class InputCustom extends StatelessWidget {
  final IconData icon;

  InputCustom({this.icon}) : super();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 15.0),
        child: TextFormField(
          cursorWidth: 5,
          cursorRadius: Radius.circular(10),
          style: TextStyle(),
          decoration: InputDecoration(
            border: InputBorder.none,
            icon: Icon(
              icon,
              color: Colors.grey[800],
              size: 22.0,
            ),
          ),
        ),
      ),
    );
  }
}
