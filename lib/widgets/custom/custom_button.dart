import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      height: 55,
      color: color,
      onPressed: () {},
      child: Text(
        text,
        style: GoogleFonts.montserrat(color: Colors.white),
      ),
    );
  }
}
