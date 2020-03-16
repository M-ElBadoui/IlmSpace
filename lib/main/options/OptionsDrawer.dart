import 'package:flutter/material.dart';
import 'package:ilmspace/main/options/OptionsListTile.dart';
import 'package:ilmspace/main/themes/PreferencePage.dart';

class OptionsDrawer extends StatefulWidget {
  OptionsDrawer({Key key}) : super(key: key);

  @override
  OptionsDrawerState createState() => OptionsDrawerState();
}

class OptionsDrawerState extends State<OptionsDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
                Color.fromRGBO(208, 160, 97, 1),
                Color.fromRGBO(228, 180, 117, 1)
              ]),
            ),
            child: Text("DRAWER HEADER.."),
          ),
          OptionsListTile(Icons.account_circle, "Account", () => {}),
          OptionsListTile(Icons.library_books, "News", () => {}),
          OptionsListTile(Icons.help, "Help", () => {}),
          OptionsListTile(Icons.settings, "Settings", () {
            Navigator.of(context).pop();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PreferencePage()));
          }),
          OptionsListTile(Icons.priority_high, "About", () => {}),
        ],
      ),
    );
  }
}

//Navigator.push(
//context,
//MaterialPageRoute(
//builder: (context) => PreferencePage())),
