import 'package:flutter/material.dart';

class CustomeText extends StatelessWidget {
  const CustomeText(
      {super.key,
      required this.text,
      this.style,
      this.color,
      this.fontsize,
      this.fontweight});
  final String text;
  final Color? color;
  final double? fontsize;
  final FontWeight? fontweight;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(textAlign: TextAlign.start, text, style: style);
  }
}
