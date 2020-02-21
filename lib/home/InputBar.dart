import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputBar extends StatefulWidget {
  InputBar({this.width, this.height, this.paddingHeight, this.input});

  final width;
  final height;
  final paddingHeight;

  final Widget input;

  @override
  InputBarState createState() => InputBarState();
}

class InputBarState extends State<InputBar> {

  @override
  Widget build(BuildContext context) {
    var inputHeight = widget.height / 2;
    var width = widget.width;
    var height = widget.height + inputHeight + widget.paddingHeight;



    return Container(
      width: width,
      height: height,
      alignment: Alignment.topLeft,
      child: Stack(
        children: <Widget>[
          CustomPaint(
            painter: new InputBarPainter(
              width: width,
              height: inputHeight,
            ),
          ),
          Container(
            padding: EdgeInsetsDirectional.fromSTEB(0, inputHeight/5, 0, 0),
            alignment: Alignment.topCenter,
            child: widget.input,
          )
        ],
      ),
    );
  }
}

class InputBarPainter extends CustomPainter {
  InputBarPainter({this.width, this.height});

  final double width;
  final double height;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // set the color property of the paint
    paint.color = Color.fromRGBO(243, 243, 238, 1);
    // center of the canvas is (x,y) => (width/2, height/2)
    var center = Offset(size.width / 2, size.height / 2);

    // draw the circle on centre of canvas having radius 75.0
    Rect myRect = center & Size(width, height);

    canvas.drawRRect(
        RRect.fromRectAndRadius(myRect, Radius.circular(50)), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
