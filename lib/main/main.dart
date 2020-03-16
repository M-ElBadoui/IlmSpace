import 'package:flutter/material.dart';
import 'package:ilmspace/home/personal/PersonalPage.dart';
import 'package:ilmspace/main/MainScreen.dart';
import 'package:ilmspace/main/themes/ThemeState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ilmspace/main/themes/ThemeBloc.dart';


void main() => runApp(IlmSpace());


class IlmSpace extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildWithTheme,
      ),
    );
}

Widget _buildWithTheme(BuildContext context, ThemeState state) {
  return MaterialApp(
    theme: state.themeData,

    initialRoute: '/main',
    routes: <String, WidgetBuilder>{
      '/main': (BuildContext context) => MainScreen(),
      '/personal': (BuildContext context) => PersonalPage(),
    },
    title: 'main',
  );
}
}




//      darkTheme: ThemeData.dark(),
//      theme: ThemeData(
//        primaryColorDark: Colors.grey,
//        canvasColor: Colors.white,
//        primaryColor: Colors.green,
//        accentColor: Colors.grey,
//        splashColor: Colors.grey,
//        textTheme: TextTheme(
//
//          body1: TextStyle(),
//          body2: TextStyle(),
//        ).apply(
//          bodyColor: Colors.orange,
//          displayColor: Colors.grey,
//        ),
//      ),