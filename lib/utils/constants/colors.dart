import 'package:flutter/material.dart';

class FColors{
  FColors._();

  //App Basic Colors
  static const Color primary = Color(0xFFF28907);
  static const Color secondary = Color(0xFF8C4303);
  static const Color accent = Color(0xFFD9AC84);
  static const Color brightOrange = Color(0xFFF25C05);
  static const Color amber = Color(0xFFFFC107);

  //Gradient Colors
  static const Gradient linearGradient = LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.707, -0.707),
      colors: [
        Color(0xffff9a9e),
        Color(0xfffad0c4),
        Color(0xfffad0c4),
      ]);

  //Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  //Background Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);
  static const Color darkBackground = Color(0xFF181818);
  static const Color lightBackground = Color(0xFFF5F5F5);

  //Background Container Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = FColors.textWhite.withOpacity(0.1);

  //Button Colors
  static const Color buttonPrimary = Color(0xFFF28907);
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  //Border Colors
  static const Color borderPrimary = Color(0xFFF28907);
  static const Color borderSecondary = Color(0xFF6C757D);

  //Error and Validation colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  //Neutral Shades
  static const Color black = Color(0xFF000000);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Color(0x00000000);


}