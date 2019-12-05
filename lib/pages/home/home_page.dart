import 'package:camelo_app/widget/sliver_appbar_delegate.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: _body(),
    );
  }

  _body(){
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: SliverAppBarDelegateCustom(
              maxHeight: 80,
              minHeight: 80,
              child: Text("teste")
            ),
          ),
        ],
      ),
    );
  }
}
