import 'package:camelo_app/widget/cabecalho_widget.dart';
import 'package:camelo_app/widget/login_action_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttie/fluttie.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  FluttieAnimationController shockedEmoji;

  @override
  initState() {
    super.initState();
    prepareAnimation();
  }

  @override
  dispose() {
    super.dispose();
    shockedEmoji?.dispose();
  }

  prepareAnimation() async {
    var instance = Fluttie();
    var emojiComposition =
        await instance.loadAnimationFromAsset("assets/lottie/favs.json");
    shockedEmoji = await instance.prepareAnimation(
      emojiComposition,
      duration: const Duration(seconds: 2),
      preferredSize: Size(300, 300),
      repeatCount: const RepeatCount.infinite(),
      repeatMode: RepeatMode.START_OVER,
    );
    shockedEmoji.start();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Cabecalho(
                "Meus Favoritos",
                body:
                    "Acesse sua conta para visualizar seus produtos favoritos!",
              ),
              LoginAction(),
              Container(
                padding: EdgeInsets.all(16),
                height: 200,
                width: 200,
                child: FluttieAnimation(shockedEmoji),
              )
            ],
          ),
        ),
      ),
    );
  }
}
