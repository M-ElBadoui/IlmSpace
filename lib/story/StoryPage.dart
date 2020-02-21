import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget {
  StoryPage({Key key}) : super(key: key);

  @override
  StoryPageState createState() => StoryPageState();
}

class StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight / 5),
        child: AppBar(
          backgroundColor: Color.fromRGBO(66, 166, 0, 1),
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

