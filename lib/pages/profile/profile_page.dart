import 'package:camelo_app/widget/cabecalho_widget.dart';
import 'package:camelo_app/widget/login_action_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Cabecalho("Meu Perfil", body: "Acesse sua conta para visualizar seus dados!",),
              LoginAction()
            ],
          ),
        ),
      ),
    );
  }
}
