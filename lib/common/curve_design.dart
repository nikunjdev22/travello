import 'package:flutter/material.dart';
import '../Constant/colors_constant.dart';

class CurvePainter extends CustomPainter {
  bool outerCurve;

  CurvePainter(this.outerCurve);

  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = AppColors.primary;
    paint.style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width * 0.5,
        outerCurve ? size.height + 110 : size.height - 110,
        size.width,
        size.height);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
