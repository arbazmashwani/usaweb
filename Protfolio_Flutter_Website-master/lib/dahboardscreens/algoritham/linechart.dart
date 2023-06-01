import 'package:flutter/material.dart';

class LineChartWithShadow extends StatelessWidget {
  final List<double> data;
  final Color lineColor;
  final Color shadowColor;

  LineChartWithShadow(
      {required this.data, required this.lineColor, required this.shadowColor});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LineChartPainter(
          data: data, lineColor: lineColor, shadowColor: shadowColor),
    );
  }
}

class LineChartPainter extends CustomPainter {
  final List<double> data;
  final Color lineColor;
  final Color shadowColor;

  LineChartPainter(
      {required this.data, required this.lineColor, required this.shadowColor});

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = brightenColor(
          lineColor, 0.3) // Increase brightness here (0.2 is an example)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final shadowPaint = Paint()
      ..color = shadowColor.withOpacity(0.07)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height - data[0]);

    final dataLength = data.length;

    for (int i = 0; i < dataLength - 1; i++) {
      final x = i.toDouble() * (size.width / (dataLength - 1));
      final y = size.height - data[i];

      final nextX = (i + 1).toDouble() * (size.width / (dataLength - 1));
      final nextY = size.height - data[i + 1];

      final controlPointX = x + (nextX - x) / 2;
      // ignore: unused_local_variable
      final controlPointY = y + (nextY - y) / 2;

      path.cubicTo(controlPointX, y, controlPointX, nextY, nextX, nextY);
    }

    final shadowPath = Path.from(path);
    shadowPath.lineTo(size.width, size.height);
    shadowPath.lineTo(0, size.height);
    shadowPath.close();

    // Exclude bottom line from shadowPath
    shadowPath.lineTo(0, size.height - data[0]);

    canvas.drawPath(shadowPath, shadowPaint);
    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(LineChartPainter oldDelegate) {
    return oldDelegate.data != data ||
        oldDelegate.lineColor != lineColor ||
        oldDelegate.shadowColor != shadowColor;
  }

  Color brightenColor(Color color, double factor) {
    assert(factor >= 0 && factor <= 1.0);
    final hsl = HSLColor.fromColor(color);
    final hslBrightened = hsl.withLightness(
        (hsl.lightness + (1.0 - hsl.lightness) * factor).clamp(0.0, 1.0));
    return hslBrightened.toColor();
  }
}
