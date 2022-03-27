import 'package:flutter/material.dart';

import '../../utils/config/constants.dart';
import '../../utils/config/size_config.dart';

class DefaultCard extends StatelessWidget {
  const DefaultCard(
      {Key? key,
      required this.height,
      required this.width,
      required this.child,
      this.color = kWhiteColor,
      this.gradient,
      this.radius = 8})
      : super(key: key);
  final double height;
  final double width;
  final Widget child;
  final double radius;
  final Color color;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(height),
      width: getProportionateScreenWidth(width),
      decoration: BoxDecoration(
          gradient: gradient,
          color: color,
          borderRadius: BorderRadius.circular(radius)),
      child: Center(child: child),
    );
  }
}
