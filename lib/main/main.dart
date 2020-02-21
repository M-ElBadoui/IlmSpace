import 'package:flutter/material.dart';
import 'package:ilmspace/home/personal/PersonalPage.dart';
import 'package:ilmspace/main/MainScreen.dart';
import 'package:ilmspace/main/Mode.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/main',
      routes: <String, WidgetBuilder>{
        '/main': (BuildContext context) => MainScreen(mode: BrownMode,),
        '/personal': (BuildContext context) => PersonalPage(),
      },
      title: 'main',

    );
  }
}

Mode DarkMode = Mode(backgroundColor: Color.fromRGBO(20, 20, 20, 1), foregroundColor: Color.fromRGBO(60, 60, 60, 1), buttonColor: Color.fromRGBO(248, 52, 72, 1), iconColor: Colors.white);
Mode BrownMode = Mode(backgroundColor: Color.fromRGBO(243, 243, 238, 1), foregroundColor: Color.fromRGBO(208, 160, 97, 1), buttonColor: Color.fromRGBO(189, 189, 164, 1), iconColor: Colors.black);




