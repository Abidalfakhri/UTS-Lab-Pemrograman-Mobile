import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.asset = 'assets/images/logo.png',
    this.sizePercent = 22,
  });

  final String asset;
  final double sizePercent;

  @override
  Widget build(BuildContext context) {
    final size = context.wp(sizePercent).clamp(72.0, 160.0);
    return Image.asset(asset, width: size, height: size, fit: BoxFit.contain);
  }
}
