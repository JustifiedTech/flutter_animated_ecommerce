import 'package:flutter/material.dart';
import 'package:team_apt_task/utils/config/constants.dart';

class LoadindIndicator extends StatelessWidget {
  const LoadindIndicator({Key? key, this.radius = 30}) : super(key: key);
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: kPrimaryColor,
      child: const CircularProgressIndicator(
        color: kWhiteColor,
      ),
    );
  }
}
