import 'package:dynoacademy/utils/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 55,
      color: primaryColor,
      onPressed: () {},
      child: Text(
        text,
        style: GoogleFonts.montserrat(color: Colors.white),
      ),
    );
  }
}
