import 'package:flutter/material.dart';

class Cabecalho extends StatelessWidget {

  final String title;
  final String body;

  Cabecalho(this.title, {this.body = ""}) : super() ;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontFamily: 'AirbnbCereal',
              fontWeight: FontWeight.w700,
              color: Colors.grey[800],
              fontSize: 35,
            ),
          ),
          body.trim() != "" ? Text(
            body,
            style: TextStyle(
              fontFamily: 'AirbnbCereal',
              fontWeight: FontWeight.w200,
              color: Colors.grey[800],
              fontSize: 18,
            ),
          ): Text(""),
        ],
      ),
    );
  }
}
