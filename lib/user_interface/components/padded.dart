import 'package:flutter/material.dart';
import 'package:team_apt_task/utils/config/size_config.dart';

class Padded extends StatelessWidget {
  const Padded({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
        child: child);
  }
}
