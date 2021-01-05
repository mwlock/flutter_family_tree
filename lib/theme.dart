import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  textTheme: GoogleFonts.openSansTextTheme(),
  primaryColorDark: const Color(0xFF0097A7),
  primaryColorLight: const Color(0xFFB2EBF2),
  primaryColor: const Color(0xFF28B463),
  accentColor: const Color(0xFF784212),
  secondaryHeaderColor: const Color(0xFF784212),
  scaffoldBackgroundColor: const Color(0xFFD5F5E3),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
