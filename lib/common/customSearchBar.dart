import 'package:FlixTime/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/constants/colors.dart';
import '../utils/localization/localization_manager.dart';
import '../utils/theme/theme_manager.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _controller = TextEditingController();
  String _enteredText = "";
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final localeManager = Provider.of<LocaleManager>(context);
    return TextField(
      controller: _controller,
      onChanged: (text){
        setState(() {
          _enteredText = text;
        });
        print("Yazılan metin: $_enteredText");
      },
      style: TextStyle(
        color: FColors.black,
        fontSize: FSizes.fontSizeMd,
      ),
      decoration: InputDecoration(
        hintText: localeManager.translate("search") + "...",
        hintStyle: TextStyle(
          color: Colors.grey[600],
          fontSize: 16,
        ),
        prefixIcon: Icon(Icons.search, color: FColors.primary, size: 24),
        filled: true,
        fillColor: FColors.lightGrey.withOpacity(0.9),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: FColors.dark, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: FColors.primary, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: FColors.dark, width: 1),
        ),
      ),
    );
  }
}
