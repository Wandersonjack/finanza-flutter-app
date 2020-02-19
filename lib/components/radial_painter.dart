import 'dart:math';

import 'package:flutter/material.dart';

class RadialPainter extends CustomPainter {
  final Color bgColor;
  final Color lineColor;
  final double percent;
  final double width;

  RadialPainter({
    this.bgColor,
    this.lineColor,
    this.percent,
    this.width,
  });

  @override
  void paint(Canvas canvas, Size size) {
    //background line pain
    Paint bgLine = Paint()
      ..color = bgColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    //filled line painter
    Paint completeLine = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, bgLine); //drawing the background color
    //drawing the complete based on the percent
    double sweepAngle = 2 * pi * percent;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi /2,//starting point of the filling circle
      sweepAngle,
      false,
      completeLine,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
