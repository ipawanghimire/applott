import 'dart:math';

import 'package:flutter/material.dart';

class CenterNotchedShape extends CircularNotchedRectangle {
  CenterNotchedShape({
    this.notchRadius = 0.0,
    this.notchMargin = 0.0,
  });
  final double notchRadius;
  final double notchMargin;

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    final Path path = super.getOuterPath(host, guest);
    if (guest == null || guest.isEmpty) {
      return path;
    }

    final Rect rect =
        Rect.fromCircle(center: guest.center, radius: notchRadius);
    final double notchWidth = rect.width + notchMargin * 4;
    final double notchHeight = rect.height + notchMargin * 4;

    final double startAngle = asin(notchWidth / 2 / notchRadius);
    final double endAngle = pi - startAngle;

    final Path notchPath = Path()
      ..addArc(
        Rect.fromCenter(
          center: rect.center,
          width: notchWidth,
          height: notchHeight,
        ),
        startAngle,
        endAngle - startAngle,
      );

    path.addPath(
      notchPath,
      Offset(rect.center.dx - notchWidth / 2, rect.center.dy - notchHeight / 2),
    );
    return path;
  }
}
