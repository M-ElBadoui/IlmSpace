import 'package:flutter/material.dart';

class LeaderBoardPage extends StatefulWidget {
  LeaderBoardPage({Key key}) : super(key: key);

  @override
  LeaderBoardPageState createState() => LeaderBoardPageState();
}

class LeaderBoardPageState extends State<LeaderBoardPage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight / 5),
        child: AppBar(
          backgroundColor: Color.fromRGBO(111, 0, 111, 1),
          title: Container(
            height: 50,
            width: screenWidth,
            child: Image.asset("assets/images/home/bismillah_wide.png",
                alignment: Alignment.center),
          ),
        ),
      ),
    );
  }
}

