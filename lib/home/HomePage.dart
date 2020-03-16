import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ilmspace/home/Badge.dart';
import 'package:ilmspace/home/InputBar.dart';
import 'package:ilmspace/main/themes/AppThemes.dart';
import 'package:ilmspace/main/themes/ThemeBloc.dart';
import 'package:ilmspace/main/themes/ThemeEvent.dart';

class HomePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> drawerKey;
  final String name;
  final double appBarHeight;

  HomePage({Key key, this.drawerKey, this.name = "Mohammed", this.appBarHeight}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  var darkMode = true;

  changeMode() {
    setState(() {
      darkMode = !darkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var topBarHeight = screenHeight / 15;
    var spaceHeight = screenHeight / 6.5;
    var inputHeight = spaceHeight / 2.5;
    var inputWidth = (screenWidth / 3) / 1.1;
    var buttonBarHeight = screenHeight / 15;

    Widget Buttons() {
      return Container(
        height: buttonBarHeight,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                widget.drawerKey.currentState.openDrawer();
              },
              child: Image.asset("assets/images/icons/settings_icon.png"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/personal');
              },
              child: Image.asset("assets/images/icons/store_icon.png"),
            )
          ],
        ),
      );
    }

    Widget Personal() {
      return Container(
        alignment: Alignment.topCenter,
        child: Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InputBar(
                  width: inputWidth,
                  height: inputHeight,
                  color: Theme.of(context).canvasColor,
                  itemAlignment: Alignment.topLeft,
                  item:  Stack(
                    children: <Widget>[
                      Container(
                        height: 40,
                        width: 40 ,
                        child: ColorFiltered(
                          child: Image.asset("assets/images/home/life_bg.png"),
                          colorFilter: ColorFilter.mode(Theme.of(context).canvasColor , BlendMode.srcATop),
                        )
                      ),
                      Container(
                        height: 40,
                        width: 40 ,
                        child: Image.asset("assets/images/home/life.png"),
                      ),
                    ],
                  ),

                ),
                Badge(
                  height: spaceHeight,
                  onTap: () {
                    Navigator.pushNamed(context, '/personal');
                  },
                  badge: Image.asset("assets/images/badges/badge_kaaba.png",
                      alignment: Alignment.center),
                  percentage: 50.0,
                  level: 7,
                ),
                InputBar(
                  width: inputWidth,
                  height: inputHeight,
                  color: Theme.of(context).canvasColor,
                  itemAlignment: Alignment.topRight,
                  item:  Stack(
                    children: <Widget>[
                      Container(
                        height: 40,
                        width: 40 ,
                          child: ColorFiltered(
                              child: Image.asset("assets/images/home/coins_bg.png"),
                            colorFilter: ColorFilter.mode(Theme.of(context).canvasColor , BlendMode.srcATop),
                          )
                      ),
                      Container(
                        height: 40,
                        width: 40 ,
                        child: Image.asset("assets/images/home/coins.png"),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      drawerEdgeDragWidth: 0.0,
      appBar: PreferredSize(
        preferredSize: Size(
            screenWidth, spaceHeight + buttonBarHeight + topBarHeight + 25),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: widget.appBarHeight,
                  width: screenWidth,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                    Theme.of(context).primaryColor.withOpacity(0.5),
                    Theme.of(context).primaryColor,

                  ])),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  height: 25,
                ),
                Container(
                  height: topBarHeight,
                  child: ColorFiltered(
                    child: Image.asset("assets/images/home/bismillah.png" ),
                    colorFilter: ColorFilter.mode(darkMode ? Colors.black : Colors.white , BlendMode.srcATop),

                  ),
                ),
                Buttons(),
                Personal(),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                    shape: CircleBorder(),
                    onPressed: () => {
                          BlocProvider.of<ThemeBloc>(context).dispatch(
                              ThemeChanged(
                                  theme: darkMode
                                      ? AppTheme.values[1]
                                      : AppTheme.values[0])),
                          changeMode(),
                        },
                    child: darkMode ? Icon(Icons.wb_sunny) : Icon(Entypo.moon)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
