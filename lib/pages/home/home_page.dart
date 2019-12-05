import 'package:camelo_app/widget/input_custom_widget.dart';
import 'package:camelo_app/widget/sliver_appbar_delegate.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: _body(),
      ),
    );
  }

  _body() {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegateCustom(
              maxHeight: 70,
              minHeight: 70,
              child: _searchBar(),
            ),
          ),
          SliverPersistentHeader(
            floating: true,
            delegate: SliverAppBarDelegateCustom(
              maxHeight: 30,
              minHeight: 30,
              child: _filterBar(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 300,
                  color: Colors.grey[50],
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Card(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Text("teste")
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _filterBar() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: <Widget>[
            Card(
              elevation: 3,
              child: Container(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "Hoje",
                  style: TextStyle(
                      fontSize: 11,
                      fontFamily: 'AirbnbCereal',
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "Celulares",
                  style: TextStyle(
                      fontSize: 11,
                      fontFamily: 'AirbnbCereal',
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _searchBar() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 10,
            child: InputCustom(
              icon: EvaIcons.searchOutline,
            ),
          ),
          Expanded(
            flex: 2,
            child: IconButton(
              onPressed: () {},
              iconSize: 28,
              icon: Container(
                child: Icon(
                  EvaIcons.funnelOutline,
                  color: Colors.grey[800],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
