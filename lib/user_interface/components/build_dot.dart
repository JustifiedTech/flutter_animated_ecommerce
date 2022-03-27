import 'package:flutter/material.dart';

import '../../utils/config/constants.dart';

class BuildDot extends StatelessWidget {
  const BuildDot({
    Key? key,
    required this.currentIndex,
    required this.index,
    this.size = 10,
  }) : super(key: key);
  final int? currentIndex, index;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: size,
      width: size,
      decoration: BoxDecoration(
          color: currentIndex == index ? kPrimaryColor : kGrey2,
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
