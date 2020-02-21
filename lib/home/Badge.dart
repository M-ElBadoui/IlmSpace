import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Badge extends StatefulWidget {
  Badge({this.height, this.onTap, this.level, this.badge, this.percentage});

  final height;
  final onTap;
  final level;
  final badge;
  final percentage;

  @override
  BadgeState createState() => BadgeState();
}

class BadgeState extends State<Badge> {
  @override
  Widget build(BuildContext context) {
    var badgeWidth = widget.height;
    var expBarWidth = badgeWidth / 1.3;

    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        width: badgeWidth,
        height: badgeWidth,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: CustomPaint(
                painter: BadgeContainer(
                  width: badgeWidth,
                  height: badgeWidth,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  (badgeWidth - expBarWidth) / 2,
                  (badgeWidth - expBarWidth) / 2,
                  0,
                  0),
              child: CustomPaint(
                painter: ExpBar(
                  width: expBarWidth,
                  height: expBarWidth,
                  percentage: widget.percentage,
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: widget.badge,
              ),
            ),
            Positioned.fill(
              child: Container(
                alignment: Alignment.topCenter,
                child: Container(
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        CustomPaint(
                          painter: LevelContainer(
                            width: badgeWidth,
                            height: badgeWidth,
                          ),
                        ),
                        Text(
                          widget.level.toString(),
                          style: TextStyle(
                            height: 0.5,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpBar extends CustomPainter {
  ExpBar({this.width, this.height, this.percentage});

  final double width;
  final double height;
  final double percentage;

  final useCenter = false;

  @override
  void paint(Canvas canvas, Size size) {
    final startAngle = -math.pi / 2;
    final sweepAngle = 2 * math.pi * percentage / 100;

    final paint = Paint()
      ..color = Color.fromRGBO(211, 188, 95, 1)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = width / 9;


    Rect myRect =
        new Rect.fromLTWH(size.width / 2, size.height / 2, width, height);

    canvas.drawArc(myRect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class BadgeContainer extends CustomPainter {
  BadgeContainer({this.width, this.height});

  final double width;
  final double height;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Color.fromRGBO(243, 243, 238, 1);

    // center of the canvas is (x,y) => (width/2, height/2)
    var center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, width / 2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class LevelContainer extends CustomPainter {
  LevelContainer({this.width, this.height});

  final double width;
  final double height;

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = Paint()
      ..color = Color.fromRGBO(0, 0, 0, 1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = width / 12;
    final fill = Paint()..color = Color.fromRGBO(243, 243, 238, 1);

    var center = Offset(0, 0);

    canvas.drawCircle(center, width / 8, stroke);
    canvas.drawCircle(center, width / 8, fill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
