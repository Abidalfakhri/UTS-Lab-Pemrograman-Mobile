import 'package:flutter/widgets.dart';


extension ResponsiveContext on BuildContext {
  Size get screen => MediaQuery.sizeOf(this);


  double wp(double percent) => screen.width * percent / 100;

  double hp(double percent) => screen.height * percent / 100;
  double sp(double size) {
    final scale = (screen.shortestSide / 390).clamp(0.85, 1.35);
    return size * scale;
  }

  bool get isLandscape => MediaQuery.orientationOf(this) == Orientation.landscape;
  bool get isWide => screen.width >= 700;
}
