import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class LoginAction extends StatelessWidget {
  const LoginAction({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(219, 42, 42, 1),
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            height: 50,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Icon(
                    EvaIcons.emailOutline,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Text(
                    "Continuar com Email",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'AirbnbCereal',
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey[800], width: 1.5),
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Icon(
                    EvaIcons.googleOutline,
                    size: 30,
                    color: Colors.grey[800],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Text(
                    "Continuar com Google",
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 18,
                        fontFamily: 'AirbnbCereal',
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text(
                "Ainda não tem uma conta? Cadastre-se",
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 15,
                  fontFamily: 'AirbnbCereal',
                ),
              )),
        ),
      ],
    );
  }
}
