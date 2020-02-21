import 'package:flutter/material.dart';
import 'package:ilmspace/friends/Friend.dart';
import 'package:ilmspace/friends/FriendCard.dart';
import 'package:ilmspace/main/Mode.dart';

class FriendsPage extends StatefulWidget {
  final Mode mode;

  FriendsPage({Key key, this.mode}) : super(key: key);

  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  static Image badge = Image.asset("assets/images/badges/badge_kaaba.png");

  final List<Friend> friendList = [
    Friend("Ahmad", 7, badge, Colors.grey, "hey man, how are you?",
        DateTime.now()),
    Friend("Mohammed", 19, badge, Colors.red, "Assalamu alaykom akhi",
        DateTime.now()),
    Friend("Ilias", 3, badge, Colors.brown, "How u Broda", DateTime.now()),
    Friend("Ahmad", 7, badge, Colors.grey, "hey man, how are you?",
        DateTime.now()),
    Friend("Mohammed", 19, badge, Colors.red, "Assalamu alaykom akhi",
        DateTime.now()),
    Friend("Ilias", 3, badge, Colors.brown, "How u Broda", DateTime.now()),
    Friend("Ahmad", 7, badge, Colors.grey, "hey man, how are you?",
        DateTime.now()),
    Friend("Mohammed", 19, badge, Colors.red, "Assalamu alaykom akhi",
        DateTime.now()),
    Friend("Ilias", 3, badge, Colors.brown, "How u Broda", DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: widget.mode.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight / 7),
        child: AppBar(
          backgroundColor: widget.mode.foregroundColor,
          title: Container(
            height: 2,
            width: screenWidth,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              color: widget.mode.foregroundColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
//          width: screenWidth/1.1,
//          height: screenHeight/2,
              child: ListView.builder(
                itemCount: 9,
                itemBuilder: (context, index) => FriendCard(context, index, friendList),
              ),
            ),
          ),
        ],
      )
    );
  }
}
