import 'package:camelo_app/components/cabecalho_widget.dart';
import 'package:camelo_app/components/login_action_widget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark
    ));

    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: _body(),
      ),
    );
  }

  Container _body() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Cabecalho('Login Page',
              body: 'Acesse sua conta e tenha acesso a conteúdos exclusivos!'),
          LoginAction()
        ],
      ),
    );
  }
}


