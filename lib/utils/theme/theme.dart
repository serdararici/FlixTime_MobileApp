import 'package:flix_time/utils/constants/colors.dart';
import 'package:flix_time/utils/theme/custom_themes/bottom_navigation_theme.dart';
import 'package:flutter/material.dart';

import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';

class FAppTheme {
  FAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    //fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: FColors.primary,
    scaffoldBackgroundColor: FColors.light,
    textTheme: FAppTextTheme.lightTextTheme,
    chipTheme: FChipTheme.lightChipTheme,
    appBarTheme: FAppBarTheme.lightAppBarTheme,
    checkboxTheme: FCheckboxTheme.lightCheckBoxTheme,
    bottomSheetTheme: FBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: FAppElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: FOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: FTextFormFieldTheme.lightInputDecorationTheme,
    bottomNavigationBarTheme: FBottomNavigationBarTheme.lightBottomNavigationBarTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    //fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: FColors.primary,
    scaffoldBackgroundColor: FColors.dark,
    textTheme: FAppTextTheme.darkTextTheme,
    chipTheme: FChipTheme.darkChipTheme,
    appBarTheme: FAppBarTheme.darkAppBarTheme,
    checkboxTheme: FCheckboxTheme.darkCheckBoxTheme,
    bottomSheetTheme: FBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: FAppElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: FOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: FTextFormFieldTheme.darkInputDecorationTheme,
    bottomNavigationBarTheme: FBottomNavigationBarTheme.darkBottomNavigationBarTheme,
  );
}