import 'package:camelo_app/widget/cabecalho_widget.dart';
import 'package:camelo_app/widget/login_action_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttie/fluttie.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Cabecalho("Meus Favoritos", body: "Acesse sua conta para visualizar seus produtos favoritos!",),
              LoginAction(),

            ],
          ),
        ),
      ),
    );
  }
}
