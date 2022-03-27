import 'package:flutter/material.dart';
import 'package:team_apt_task/utils/config/size_config.dart';

class Background extends StatelessWidget {
  const Background({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/top.png',
            ),
          ),
          Positioned(
            bottom: -10,
            right: -10,
            child: Image.asset(
              'assets/images/bottom.png',
            ),
          ),
          child,
        ],
      ),
    );
  }
}
