import 'package:flutter/material.dart';

class PersonalPage extends StatefulWidget {
  PersonalPage({Key key}) : super(key: key);

  @override
  PersonalPageState createState() => PersonalPageState();
}

class PersonalPageState extends State<PersonalPage> {
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
          ),
        ),
      ),
    );
  }
}

