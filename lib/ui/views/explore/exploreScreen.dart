import 'package:carousel_slider/carousel_slider.dart';
import 'package:FlixTime/ui/views/explore/moviesScreen.dart';
import 'package:FlixTime/ui/views/explore/seriesScreen.dart';
import 'package:FlixTime/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/localization/localization_manager.dart';
import '../../../utils/theme/theme_manager.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String selectedTab = "Movies";
  final List<String> tabs = ["Movies", "Series"];
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final localeManager = Provider.of<LocaleManager>(context);

    return Scaffold(
      appBar: AppBar(title: Text(localeManager.translate("explore"),),),
      body: Column(
        children: [
          _movieSeriesButtons(context),
          _animatedPageSwitcher(),
        ],
      ),
    );
  }

  Expanded _animatedPageSwitcher() {
    return Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: _getPage(selectedTab),
          ),
        );
  }

  Padding _movieSeriesButtons(BuildContext context) {
    final localeManager = Provider.of<LocaleManager>(context);
    return Padding(
          padding: const EdgeInsets.symmetric(vertical: FSizes.xs),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: tabs.map((tab) {
              final bool isSelected = selectedTab == tab;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTab = tab;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 48.0),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(FSizes.buttonRadius),
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                    /*
                    boxShadow: isSelected
                        ? [
                      BoxShadow(
                        color: Theme.of(context)
                            .primaryColor
                            .withOpacity(0.5), //Shadow
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      )
                    ] : [],

                     */
                  ),
                  child: Text(
                    tab == "Movies" ? localeManager.translate("movies") : localeManager.translate("series") ,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
  }
  Widget _getPage(String tab) {
    switch (tab) {
      case "Movies":
        return const MoviesScreen();
      case "Series":
        return const SeriesScreen();
      default:
        return const Center(child: Text("Unknown Page"));
    }
  }
}
