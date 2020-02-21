import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  QuizPage({Key key}) : super(key: key);

  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight / 5),
        child: AppBar(
          backgroundColor: Color.fromRGBO(111, 111, 111, 1),
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

