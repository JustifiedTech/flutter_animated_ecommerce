import 'package:flutter/material.dart';

import '../../utils/config/size_config.dart';

class Space extends StatelessWidget {
  const Space({
    Key? key,
    this.width = 0.0,
    this.height = 0.0,
  }) : super(key: key);
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: getProportionateScreenHeight(height),
        width: getProportionateScreenWidth(width));
  }
}
