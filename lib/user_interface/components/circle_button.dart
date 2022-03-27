import 'package:flutter/material.dart';

import '../../utils/config/constants.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  const CircleButton({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap(),
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Card(
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Icon(
            icon,
            color: kGreyColor,
            size: 15.0,
          ),
        ),
      ),
    );
  }
}
