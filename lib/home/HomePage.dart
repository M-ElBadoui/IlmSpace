import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ilmspace/home/Badge.dart';
import 'package:ilmspace/home/InputBar.dart';
import 'package:ilmspace/main/Mode.dart';

class HomePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> drawerKey;
  final Mode mode;
  final String name;

  HomePage({Key key, this.drawerKey, this.mode, this.name = "Mohammed"})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static Image life =
      Image.asset("assets/images/home/life.png", alignment: Alignment.center);

  List<Image> lives = [life, life, life, life, life, life, life];

  void loseLife() {
    setState(() {
      if (lives.length > 0) {
        lives.removeLast();
      }
    });
  }

  void gainLife() {
    setState(() {
      if (lives.length < 7) {
        lives.add(life);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var topBarHeight = screenHeight / 15;
    var spaceHeight = screenHeight / 6.5;
    var inputHeight = spaceHeight / 2;
    var inputWidth = (screenWidth / 3) / 1.1;
    var paddingHeight = (screenWidth - inputWidth * 2 - spaceHeight) / 3;
    var buttonBarHeight = 50.0;

    return Scaffold(
        drawerEdgeDragWidth: 0.0,
        backgroundColor: widget.mode.backgroundColor, // Background color
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // Hide Drawer hamburger icon
          elevation: 0,
          // Remove shadow
          backgroundColor: widget.mode.foregroundColor,
          // Tint color
          title: Container(
            height: topBarHeight,
            width: screenWidth,
            child: Image.asset("assets/images/home/bismillah_wide.png",
                alignment: Alignment.center),
          ),
          bottom: PreferredSize(
            preferredSize: Size(screenWidth, spaceHeight + buttonBarHeight),
            child: Column(
              children: <Widget>[
                Container(
                  height: buttonBarHeight,
                  child: ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          widget.drawerKey.currentState.openDrawer();
                        },
                        child: Image.asset(
                            "assets/images/icons/settings_icon.png",
                            alignment: Alignment.center),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/personal');
                        },
                        child: Image.asset("assets/images/icons/store_icon.png",
                            alignment: Alignment.center),
                      )
                    ],
                  ),
                ),
                Stack(
                  children: <Widget>[
                    AppBarSpace(screenWidth, spaceHeight),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        InputBar(
                          width: inputWidth,
                          height: inputHeight,
                          paddingHeight: paddingHeight,
                          input: Text(
                            widget.name,
                            textScaleFactor: screenHeight / 650,
                          ),
                        ),
                        Badge(
                          height: spaceHeight,
                          onTap: () {
                            Navigator.pushNamed(context, '/personal');
                          },
                          badge: Image.asset(
                              "assets/images/badges/badge_kaaba.png",
                              alignment: Alignment.center),
                          percentage: 70.0,
                          level: 7,
                        ),
                        InputBar(
                          width: inputWidth,
                          height: inputHeight,
                          paddingHeight: paddingHeight,
                          input: Container(
                              height: inputHeight / 3.5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: lives,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Container(
          width: screenWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  shape: CircleBorder(),
                  color: Colors.redAccent,
                  onPressed: loseLife,
                  child: Icon(Icons.remove)),
              FlatButton(
                  shape: CircleBorder(),
                  color: Colors.greenAccent,
                  onPressed: gainLife,
                  child: Icon(Icons.add)),
            ],
          ),
        ));
  }


  Widget AppBarSpace(width, height){
    return Column(
      children: <Widget>[
        Container(
          width: width,
          height: height / 2,
        ),
        Container(
          width: width,
          height: height / 2,
          color: widget.mode.backgroundColor,
        ),
      ],
    );
  }
}


