import 'package:flix_time/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class FBottomNavigationBarTheme {
  FBottomNavigationBarTheme._();

  // Light Theme
  static final lightBottomNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: FColors.white,
    selectedItemColor: FColors.primary,
    unselectedItemColor: Colors.grey,
    selectedIconTheme: const IconThemeData(size: 28),
    unselectedIconTheme: const IconThemeData(size: 24),
    selectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: FColors.primary),
    unselectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey),
    elevation: 8,
    type: BottomNavigationBarType.fixed,
  );

  // Dark Theme
  static final darkBottomNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: FColors.black,
    selectedItemColor: FColors.primary,
    unselectedItemColor: Colors.grey.shade600,
    selectedIconTheme: const IconThemeData(size: 28),
    unselectedIconTheme: const IconThemeData(size: 24),
    selectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: FColors.white),
    unselectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.grey),
    elevation: 8,
    type: BottomNavigationBarType.fixed,
  );
}