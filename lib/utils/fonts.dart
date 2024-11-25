import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static double buttonLabel = 18;

  static TextStyle clockStyle = GoogleFonts.robotoSlab(
    color: Colors.white,
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );

  static TextStyle buttonStyle = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: buttonLabel,
    fontWeight: FontWeight.bold,
  );
}
