import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ilmspace/friends/Friend.dart';
import 'package:google_fonts/google_fonts.dart';

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
          top: BorderSide(color: Color.fromRGBO(155, 145, 135, 1), width: 0.3),
            ),
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 15),
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
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
//                        color: Colors.white
                      ),
                    ),
                    Text(
                      (friend.lastSeen.toString().substring(0, 16) == nowNow)
                          ? "Today " +
                              friend.lastSeen.toString().substring(10, 16)
                          : friend.lastSeen.toString().substring(0, 16),
                      style: GoogleFonts.raleway(
//                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(
                  MaterialCommunityIcons.chat_outline,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 25,
                ),
                Icon(
                  MaterialCommunityIcons.sword_cross,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
