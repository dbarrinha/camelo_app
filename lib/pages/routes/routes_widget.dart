import 'dart:io';
import 'package:camelo_app/pages/favourites/favourites_page.dart';
import 'package:camelo_app/pages/home/home_page.dart';
import 'package:camelo_app/pages/profile/profile_page.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Routes extends StatefulWidget {
  @override
  RoutesState createState() => RoutesState();
}

class RoutesState extends State<Routes> with TickerProviderStateMixin {
  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();
  TabController _tabController;
  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Você quer sair do aplicativo?'),
//        content: new Text('Você quer sair do aplicativo?'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('Não'),
          ),
          new FlatButton(
            onPressed: () => exit(0),
            child: new Text('Sim'),
          ),
        ],
      ),
    ) ??
        false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._tabController = new TabController(initialIndex: 0, length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);

  }


  void _handleTabSelection() {
    setState(() {
      if (_tabController.indexIsChanging) {
        currentPage = _tabController.index;
      }
      setState(() {
        this.currentPage = _tabController.index;
      });
      print(
          "Changed tab to: ${currentPage.toString().split('.').last} , index: ${_tabController.index}");
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return new WillPopScope(
      onWillPop: _onWillPop,
      child: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          bottomNavigationBar: Container(
            height: 60,
            color: Colors.white,
            child: TabBar(
              tabs: [
                Tab(
                  child: Column(
                    children: <Widget>[
                      Icon(EvaIcons.searchOutline, size: 25, color: currentPage == 0 ? Colors.grey[900] :Colors.grey[600],),
                      Text("EXPLORAR", style: TextStyle(fontSize: 14, fontFamily: 'AirbnbCereal'),),
                    ],
                  ),
                ),
                Tab(
                  //icon: Icon(EvaIcons.heartOutline, size: 25, color: Colors.grey[900],),
                  child: Column(
                    children: <Widget>[
                      Icon(EvaIcons.heartOutline, size: 25, color: currentPage == 1 ? Colors.grey[900] :Colors.grey[600],),
                      Text("FAVORITOS", style: TextStyle(fontSize: 14, fontFamily: 'AirbnbCereal'),),
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    children: <Widget>[
                      Icon(EvaIcons.personOutline, size: 25, color: currentPage == 2 ? Colors.grey[900] :Colors.grey[600],),
                      Text("PERFIL", style: TextStyle(fontSize: 14, fontFamily: 'AirbnbCereal'),),
                    ],
                  ),
                ),
              ],
              labelColor: Colors.black,
              controller: _tabController,
              unselectedLabelColor: Colors.grey[600],
              labelPadding: EdgeInsets.all(0),
              indicatorPadding: EdgeInsets.all(0),
              indicatorColor: Colors.transparent,
              onTap: (index){
                setState(() {
                  this.currentPage = index;
                });
              },
            ),
          ),
          body: TabBarView(
            children: [
              new HomePage(),
              new FavoritePage(),
              new ProfilePage()
            ],
            controller: _tabController,
            physics: new NeverScrollableScrollPhysics(),
          ),
        ),
      ),
    );
  }

}
