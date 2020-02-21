import 'package:flutter/material.dart';
import 'package:ilmspace/friends/Friend.dart';

class FriendCard extends StatefulWidget {
  FriendCard(BuildContext context, this.index, this.friendList);

  final int index;
  final List<Friend> friendList;

  @override
  _FriendCardState createState() => _FriendCardState();
}

class _FriendCardState extends State<FriendCard> {
  static String currentTime = DateTime.now().toString();
  static String nowNow = currentTime.substring(0, 16);

  @override
  Widget build(BuildContext context) {
    final Friend friend = widget.friendList[widget.index];

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: friend.color,
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    child: friend.badge,
                  ),
                ],
              ),
              SizedBox(
                width: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    friend.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text((friend.lastSeen.toString().substring(0, 16) == nowNow) ? "Today " + friend.lastSeen.toString().substring(10, 16) : friend.lastSeen.toString().substring(0, 16)),
                ],
              ),
            ],
          ),
          Icon(Icons.chat_bubble_outline),
        ],
      ),
    );
  }
}
