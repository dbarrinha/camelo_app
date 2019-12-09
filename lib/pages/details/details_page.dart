import 'package:camelo_app/util/navigation.dart';
import 'package:camelo_app/widget/sliver_appbar_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailsPage extends StatelessWidget {
  String tag;

  DetailsPage({Key key, @required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent));

    return Scaffold(
      appBar: null,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegateCustom(
              maxHeight: 350,
              minHeight: 60,
              child: Stack(
                children: <Widget>[
                  _imageHero(),
                  Positioned(
                    top: 1,
                    left: 1,
                    child: FlatButton(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegateCustom(
              maxHeight: 60,
              minHeight: 60,
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(16),
                child: Text(
                  "Título do produto",
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                ),
              ),
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
      ),
    );
  }

  _imageHero() {
    return Hero(
      tag: this.tag,
      child: Container(
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

      child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed in quam a dolor mattis ornare. Proin nisi neque, suscipit ac est a, bibendum placerat enim. Fusce dapibus imperdiet venenatis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In non risus non augue viverra placerat eget et urna. Quisque quis arcu eros. Nullam ut ligula lorem.",
      style: TextStyle(color: Colors.grey[800], fontSize: 16, textBaseline: TextBaseline.alphabetic),),
    );
  }
}
