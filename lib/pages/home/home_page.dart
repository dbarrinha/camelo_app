import 'package:camelo_app/pages/details/details_page.dart';
import 'package:camelo_app/util/navigation.dart';
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
        body: _body(context),
      ),
    );
  }

  _body(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
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
            pinned: true,
            delegate: SliverAppBarDelegateCustom(
              maxHeight: 30,
              minHeight: 30,
              child: _filterBar(),
            ),
          ),
          SliverPersistentHeader(
            delegate: SliverAppBarDelegateCustom(
              maxHeight: 5,
              minHeight: 5,
              child: Divider(),
            ),
          ),
          SliverPersistentHeader(
            delegate: SliverAppBarDelegateCustom(
              maxHeight: 30,
              minHeight: 30,
              child: _subTitle("Sugestôes para você"),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 180,
                  color: Colors.white,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      _cardAD(context,"1"),
                      _cardAD(context,"2"),
                      _cardAD(context,"3"),
                      _cardAD(context,"4"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegateCustom(
              maxHeight: 20,
              minHeight: 25,
              child: _subTitle("Mais Produtos"),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _cardProduct(context,"5"),
                _cardProduct(context,"6"),
                _cardProduct(context,"7"),
                _cardProduct(context,"18"),
                _cardProduct(context,"9"),
                _cardProduct(context,"10"),
                _cardProduct(context,"11"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _subTitle(text) {
    return Container(
      color: Colors.white,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.grey[800],
              fontSize: 16),
        ),
      ),
    );
  }

  _cardProduct(context,tag) {
    return GestureDetector(
      onTap: (){
        push(context, DetailsPage(tag:tag), false);
      },
      child: Container(
        height: 120,
        child: Card(
          elevation: 2,
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Hero(
                    tag: tag,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8)),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://picsum.photos/350?image="+tag),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  flex: 4,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(10),
                    child: Text("teste"),
                  ),
                  flex: 8,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _cardAD(context,tag) {
    return GestureDetector(
      onTap: (){
        push(context, DetailsPage(tag:tag), false);
      },
      child: Card(
        elevation: 3,
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 10,
                child: Stack(
                  children: <Widget>[
                    Hero(
                      tag: tag,
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://picsum.photos/350?image="+tag),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            "\$12",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.topLeft,
                  //padding: EdgeInsets.all(10),
                  child: Text("teste2"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _filterBar() {
    return Container(
      color: Colors.white,
      child: Container(
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
