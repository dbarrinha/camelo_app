import 'package:camelo_app/widget/sliver_appbar_delegate.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  String tag;

  DetailsPage({Key key, @required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
//        SliverAppBar(
//          expandedHeight: 300,
//          pinned: true,
//          elevation: 10,
//
//          flexibleSpace: FlexibleSpaceBar(
//            background: _imageHero(),
//            //centerTitle: true,
//          ),
//        ),
        SliverPersistentHeader(
          delegate: SliverAppBarDelegateCustom(
            maxHeight: 350,
            minHeight: 30,
            child: _imageHero(),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              _bodyDetail(),
            ],
          ),
        )
      ],
    );
  }

  _imageHero() {
    return Hero(
      tag: this.tag,
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage("https://picsum.photos/350?image=" + tag),
              fit: BoxFit.cover),
        ),
      ),
    );
  }

  _bodyDetail() {
    return Container(
      height: 800,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Material(
          child: Text("Campo maior fresco!"),
        ),
      ),
    );
  }
}
