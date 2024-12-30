import 'package:flix_time/ui/views/explore/exploreScreen.dart';
import 'package:flix_time/ui/views/home/homeScreen.dart';
import 'package:flix_time/ui/views/mainScreen.dart';
import 'package:flix_time/utils/localization/localization_manager.dart';
import 'package:flix_time/utils/theme/theme.dart';
import 'package:flix_time/utils/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ThemeManager()),
      ChangeNotifierProvider(create: (_) => LocaleManager()),
    ],

    child: Consumer2<ThemeManager, LocaleManager>(
    builder: (context, themeManager,localeManager, child){
        return MaterialApp(
          title: 'FlixTime',
          debugShowCheckedModeBanner: false,
          //themeMode: ThemeMode.system,
          themeMode: themeManager.themeMode,
          theme: FAppTheme.lightTheme,
          darkTheme: FAppTheme.darkTheme,
          locale: localeManager.currentLocale,
          localizationsDelegates: const[
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const[
          Locale('en'),
          Locale('tr'),
          Locale('de'),
          Locale('es'),
          Locale('ja'),
          ],
          home: MainScreen(),
        );
      }
    )
    );
  }
}
