import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputBar extends StatefulWidget {
  InputBar({this.width, this.height, this.paddingHeight, this.input, this.color, this.item, this.itemAlignment});

  final width;
  final height;
  final paddingHeight;
  final color;
  final input;
  final item;
  final itemAlignment;

  @override
  InputBarState createState() => InputBarState();
}

class InputBarState extends State<InputBar> {

  @override
  Widget build(BuildContext context) {
    var inputHeight = widget.height / 2;
    var width = widget.width;
    var height = widget.height + inputHeight * 2;

    return Container(
      padding: EdgeInsets.only(top: 5),
      width: width,
      height: height + inputHeight,
      child: Stack(
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(top: inputHeight/2, left: (width - width/1.2)/2),
            child: CustomPaint(
              painter: new InputBarPainter(
                width: width/1.2,
                height: inputHeight,
                color: widget.color,
              ),
            ),
          ),
          Container(
            padding: EdgeInsetsDirectional.fromSTEB(0, inputHeight/5, 0, 0),
            alignment: Alignment.topCenter,
            child: widget.input,
          ),
          Container(
            height: 50,
            alignment: widget.itemAlignment,
            child: widget.item,
          ),
        ],
      ),
    );
  }
}

class InputBarPainter extends CustomPainter {
  InputBarPainter({this.width, this.height, this.color});

  final double width;
  final double height;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;
    var center = Offset(size.width / 2, size.height / 2);

    Rect myRect = center & Size(width, height);

    canvas.drawRRect(
        RRect.fromRectAndRadius(myRect, Radius.circular(50)), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
