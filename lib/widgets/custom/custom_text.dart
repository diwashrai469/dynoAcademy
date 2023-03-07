import 'package:dynoacademy/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class CustomeText extends StatelessWidget {
  const CustomeText(
      {super.key,
      required this.text,
      this.color,
      this.fontsize,
      this.fontweight});
  final String text;
  final Color? color;
  final double? fontsize;
  final FontWeight? fontweight;

  @override
  Widget build(BuildContext context) {
    return Text(
        textAlign: TextAlign.start,
        text,
        style: CustomeTheme().mainFont(
          fontSize: fontsize,
          fontWeight: fontweight,
          color: color,
        ));
  }
}
