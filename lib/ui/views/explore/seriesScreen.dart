import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/localization/localization_manager.dart';
import '../../../utils/theme/theme_manager.dart';

class SeriesScreen extends StatefulWidget {
  const SeriesScreen({super.key});

  @override
  State<SeriesScreen> createState() => _SeriesScreenState();
}

class _SeriesScreenState extends State<SeriesScreen> {
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final localeManager = Provider.of<LocaleManager>(context);
    return Scaffold(
      appBar: AppBar(title: Text(localeManager.translate("series")),),
    );
  }
}
