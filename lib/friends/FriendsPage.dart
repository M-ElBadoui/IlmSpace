import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilmspace/friends/Friend.dart';
import 'package:ilmspace/friends/FriendCard.dart';

class FriendsPage extends StatefulWidget {
  final double appBarHeight;

  FriendsPage({Key key, this.appBarHeight}) : super(key: key);

  @override
  _FriendsPageState createState() => _FriendsPageState();
}

Image badge = Image.asset("assets/images/badges/badge_kaaba.png");

final List<Friend> friendList = [
  Friend(
      "Ahmad", 7, null, Colors.grey, "hey man, how are you?", DateTime.now()),
  Friend("Mohammed", 19, null, Colors.red, "Assalamu alaykom akhi",
      DateTime.now()),
  Friend("Ilias", 3, null, Colors.brown, "How u Broda", DateTime.now()),
  Friend(
      "Ahmad", 7, null, Colors.grey, "hey man, how are you?", DateTime.now()),
  Friend("Mohammed", 19, null, Colors.red, "Assalamu alaykom akhi",
      DateTime.now()),
  Friend("Ilias", 3, null, Colors.brown, "How u Broda", DateTime.now()),
  Friend(
      "Ahmad", 7, null, Colors.grey, "hey man, how are you?", DateTime.now()),
  Friend("Mohammed", 19, null, Colors.red, "Assalamu alaykom akhi",
      DateTime.now()),
  Friend("Ilias", 3, null, Colors.brown, "How u Broda", DateTime.now()),
];

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(

            preferredSize: Size(screenWidth, widget.appBarHeight),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    Theme.of(context).primaryColor.withOpacity(0.5),
                    Theme.of(context).primaryColor

                  ],
                ),
              ),
              alignment: Alignment.bottomCenter,
              height: widget.appBarHeight,
              child: Container(
                height: 105,
                child: SafeArea(
                  child: SearchBar(
                    searchBarStyle: SearchBarStyle(
                      backgroundColor: Color.fromRGBO(155, 155, 155, 0.5),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
                    headerPadding: EdgeInsets.symmetric(horizontal: 10),
                    listPadding: EdgeInsets.symmetric(horizontal: 10),
                    onSearch: null,
                    searchBarController: null,
                    cancellationWidget: Text("Cancel"),
                    emptyWidget: Text("empty"),
                    onItemFound: null,
                  ),
                ),
              ),
            ),
          ),
      body: Container(
        child: ListView.builder(
          itemCount: 9,
          itemBuilder: (context, index) =>
              FriendCard(context, index, friendList),
        ),
      ),
    );
  }
}
