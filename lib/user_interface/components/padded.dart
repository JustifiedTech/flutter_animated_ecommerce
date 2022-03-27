import 'package:flutter/material.dart';
import 'package:team_apt_task/utils/config/size_config.dart';

class Padded extends StatelessWidget {
  const Padded({Key? key, required this.child, this.space = 15})
      : super(key: key);
  final Widget child;
  final double space;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(space)),
        child: child);
  }
}
