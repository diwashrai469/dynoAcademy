import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  final mainPadding = const EdgeInsets.all(8);
  final screenPadding = const EdgeInsets.fromLTRB(26, 0, 27, 0);
  final primaryColor = const Color(0xFF073763);
  final fontColor = const Color(0xFF454545);

  //theme data for app
  final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: const Color(0xFF073763),
    
    //for app bar
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Color(0xFF000000),
      ),
    ),

    //elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xFF073763),
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
    ),

    //for text
    textTheme: TextTheme(
      titleLarge: GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF1E1E1E),
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF1E1E1E),
      ),
      bodySmall: GoogleFonts.montserrat(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: const Color(0xFF1E1E1E),
      ),
      bodyLarge: GoogleFonts.montserrat(
        fontWeight: FontWeight.w600,
        fontSize: 15,
        color: const Color(0xFF1E1E1E),
      ),
    ),
  );
}
