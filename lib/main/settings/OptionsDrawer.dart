
import 'package:flutter/material.dart';
import 'package:ilmspace/main/settings/OptionsListTile.dart';


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
              gradient: LinearGradient(
                  colors: <Color>[Color.fromRGBO(208, 160, 97, 1), Color.fromRGBO(228, 180, 117, 1)]),
            ),
            child: Text("DRAWER HEADER.."),
          ),
          OptionsListTile(Icons.account_circle, "Account", ()=>{}),
          OptionsListTile(Icons.library_books, "News", ()=>{}),
          OptionsListTile(Icons.help, "Help", ()=>{}),
          OptionsListTile(Icons.settings, "Settings", ()=>{}),
          OptionsListTile(Icons.priority_high, "About", ()=>{}),
        ],
      ),
    );
  }
}
