import 'package:camelo_app/pages/routes/routes_widget.dart';
import 'package:camelo_app/util/navigation.dart';
import 'package:camelo_app/widget/input_custom_widget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  PageController _pageController;
  Color left = Colors.grey[500];
  Color right = Colors.grey[800];

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));

    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: _body(context),
      ),
    );
  }

  Container _body(context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: _menuBar(),
          ),
          Expanded(
            flex: 11,
            child: Container(
              margin: EdgeInsets.only(top: 23),
              child: PageView(
                controller: _pageController,
                onPageChanged: (i) {
                  if (i == 0) {
                    setState(() {
                      right = Colors.grey[800];
                      left = Colors.grey[500];
                    });
                  } else if (i == 1) {
                    setState(() {
                      right = Colors.grey[500];
                      left = Colors.grey[800];
                    });
                  }
                },
                children: <Widget>[
                  _formLogin(context),
                  _formCadastro(context),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _formLogin(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Form(
        child: Column(
          children: <Widget>[
            InputCustom(
              icon: EvaIcons.emailOutline,
            ),
            InputCustom(
              icon: EvaIcons.lockOutline,
            ),
            SizedBox(height: 23,),
            Hero(
              tag: "singin",
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: InkWell(
                  onTap: (){
                    push(context, Routes(), false);
                  },
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(219, 42, 42, 1),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    height: 50,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: Text(
                            "Entrar",
                            style: TextStyle(
                                color: Colors.white,
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
              ),
            )
          ],
        ),
      ),
    );
  }

  _formCadastro(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Form(
        child: Column(
          children: <Widget>[
            InputCustom(
              icon: EvaIcons.personOutline,
            ),
            InputCustom(
              icon: EvaIcons.lockOutline,
            ),
            InputCustom(
              icon: EvaIcons.emailOutline,
            ),
            InputCustom(
              icon: EvaIcons.emailOutline,
            ),
            SizedBox(height: 23,),
            Hero(
              tag: "singin",
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: InkWell(
                  onTap: (){
                    push(context, Routes(), false);
                  },
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(219, 42, 42, 1),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    height: 50,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: Text(
                            "Entrar",
                            style: TextStyle(
                                color: Colors.white,
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
              ),
            )
          ],
        ),
      ),
    );
  }

  Row _menuBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap: () {
            _onSignInButtonPress();
            print("teste");
          },
          child: Text(
            "Login",
            style: TextStyle(
              fontFamily: 'AirbnbCereal',
              fontWeight: FontWeight.w700,
              color: right,
              fontSize: 35,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            _onSignUpButtonPress();
          },
          child: Text(
            "Cadastro",
            style: TextStyle(
              fontFamily: 'AirbnbCereal',
              fontWeight: FontWeight.w700,
              color: left,
              fontSize: 35,
            ),
          ),
        ),
      ],
    );
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  void _onSignUpButtonPress() {
    _pageController.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }
}
