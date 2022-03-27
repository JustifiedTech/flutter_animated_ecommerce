import 'package:flutter/material.dart';
import 'package:team_apt_task/utils/config/constants.dart';
import 'package:team_apt_task/utils/config/size_config.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.press,
    required this.text,
    this.fillColor = kPrimaryColor,
    this.color = Colors.white,
    this.border = false,
    this.width = 313,
    this.height = 56,
    this.fontSize = 18,
    this.isBold = true,
  }) : super(key: key);
  final String text;
  final VoidCallback press;
  final Color fillColor, color;
  final bool border, isBold;
  final double width, height, fontSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(width),
      height: getProportionateScreenHeight(height),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: border ? Border.all(width: 2.5, color: kWhiteColor) : null,
        ),
        child: RawMaterialButton(
          onPressed: press,
          fillColor: fillColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            text,
            style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                color: color,
                fontSize: getProportionateScreenWidth(fontSize)),
          ),
        ),
      ),
    );
  }
}
