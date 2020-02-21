import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationButton extends StatefulWidget {
  NavigationButton({
    this.icon,
    this.selected,
    this.visibility,
  });

  final Image icon;
  final VoidCallback selected;
  final bool visibility;

  @override
  NavigationButtonState createState() => NavigationButtonState();
}

class NavigationButtonState extends State<NavigationButton> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.height;

    return Container(
      height: screenWidth / 10,
      width: screenWidth / 10,
      child: InkWell(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              opacity: widget.visibility ? 1.0 : 0.0,
              child: widget.icon,
            )),
        onTap: widget.visibility
            ? () {
                widget.selected();
              }
            : null,
      ),
    );
  }
}
