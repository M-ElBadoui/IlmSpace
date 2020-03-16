import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

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
                  color: Theme.of(context).canvasColor,
                  color2: Theme.of(context).primaryColor,
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
                        color: Theme.of(context).canvasColor,
                        color2: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      '7',
                      style: GoogleFonts.amiri(
                          height: 0.5,
                          fontSize: 24,
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

    final front = Paint()
      ..color = Color.fromRGBO(100, 170, 100, 1)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = width / 9;
    final frontBlur = Paint()
      ..color = Color.fromRGBO(0, 0, 0, 0.5)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = width / 9
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 2);
    final back = Paint()
      ..color = Color.fromRGBO(90, 90, 90, 1)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = width / 9;
    final backBlur = Paint()
      ..color = Color.fromRGBO(0, 0, 0, 0.3)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = width / 9
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 2);

    Rect myRect =
        new Rect.fromLTWH(size.width / 2, size.height / 2, width, height);

    canvas.drawArc(myRect, 0, 2 * math.pi, false, backBlur);
    canvas.drawArc(myRect, 0, 2 * math.pi, false, back);
    canvas.drawArc(myRect, startAngle, sweepAngle, false, frontBlur);
    canvas.drawArc(myRect, startAngle, sweepAngle, false, front);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class BadgeContainer extends CustomPainter {
  BadgeContainer({this.width, this.height, this.color, this.color2});

  final double width;
  final double height;
  final Color color;
  final Color color2;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    var center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, width / 2, paint);
    canvas.drawCircle(
        center, width / 2.90, Paint()..color = color2.withOpacity(0.5));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class LevelContainer extends CustomPainter {
  LevelContainer({this.width, this.height, this.color, this.color2});

  final double width;
  final double height;
  final Color color;
  final Color color2;

  @override
  void paint(Canvas canvas, Size size) {

    final fill = Paint()..color = color;

    var center = Offset(0, 0);

    canvas.drawCircle(
        center,
        width / 8,
        BoxShadow(color: Colors.black, blurRadius: 3, spreadRadius: 3)
            .toPaint());

    canvas.drawCircle(center, width / 8, fill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
