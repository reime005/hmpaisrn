import 'package:flutter/material.dart';
import 'package:hmpaisrn/data/launches.dart';
import 'package:hmpaisrn/screens/rocket/detail/detail.dart';
import 'package:hmpaisrn/util/text_style.dart';

class RocketSummary extends StatelessWidget {
  final Launches launches;
  final bool horizontal;

  RocketSummary(this.launches, {this.horizontal = true});

  RocketSummary.vertical(this.launches) : horizontal = false;

  @override
  Widget build(BuildContext context) {
    Widget _planetValue({String value, String image}) {
      return new Container(
        child: new Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          new Container(width: 8.0),
          new Text(value),
        ]),
      );
    }

    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(
          horizontal ? 76.0 : 16.0, horizontal ? 76.0 : 42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment:
            horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(launches.name, style: Style.titleTextStyle),
          new Container(height: 10.0),
          new Text(
              launches.location != null ? launches.location.countrycode : "",
              style: Style.commonTextStyle),
          new Separator(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _planetValue(
                      value: launches.location != null
                          ? launches.location.name
                          : "",
                      image: "")),
            ],
          ),
          new Expanded(
              flex: horizontal ? 1 : 0,
              child: _planetValue(
                  value: launches.rocket.agencies != null
                      ? launches.rocket.agencies.name
                      : "",
                  image: ""))
        ],
      ),
    );

    final planetCard = new Container(
      child: planetCardContent,
      height: horizontal ? 124.0 : 184.0,
      margin: horizontal
          ? new EdgeInsets.only(left: 46.0)
          : new EdgeInsets.only(top: 72.0),
      decoration: new BoxDecoration(
        color: new Color(0xFF303030).withOpacity(0.8),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return new GestureDetector(
        onTap: horizontal
            ? () => Navigator.of(context).push(
                  new PageRouteBuilder(
                    pageBuilder: (_, __, ___) =>
                        new RocketDetailPage(launches: launches),
                    transitionsBuilder: (context, animation, secondaryAnimation,
                            child) =>
                        new FadeTransition(opacity: animation, child: child),
                  ),
                )
            : null,
        child: new Container(
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: new Stack(
            children: <Widget>[
              planetCard,
            ],
          ),
        ));
  }
}
