import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionsListTile extends StatelessWidget {
  OptionsListTile(this.icon, this.text, this.onTap);

  final IconData icon;
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: InkWell(
        onTap: () => {},
        splashColor: Color.fromRGBO(228, 180, 117, 1),
        child: Container(
          height: 50,
          padding: EdgeInsetsDirectional.only(start: 15, end: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(icon),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    text,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Icon(Icons.arrow_right),
            ],
          ),
        ),
      ),
    );
  }
}
