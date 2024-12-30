import 'package:flix_time/ui/views/explore/exploreScreen.dart';
import 'package:flix_time/ui/views/home/homeScreen.dart';
import 'package:flix_time/ui/views/profile/profileScreen.dart';
import 'package:flix_time/ui/views/watchList/watchListScreen.dart';
import 'package:flix_time/utils/constants/colors.dart';
import 'package:flix_time/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/localization/localization_manager.dart';
import '../../utils/theme/theme_manager.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    ExploreScreen(),
    Container(), //For FAB button
    WatchListScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final localeManager = Provider.of<LocaleManager>(context);

    return Scaffold(
      body: _pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("FAb button clicked");
        },
        backgroundColor: FColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(FSizes.fabRadius)),
        child: Icon(
          Icons.camera,
          color: FColors.white,
          size: FSizes.fabIconSize,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            //activeIcon: Icon(Icons.home),
            label: localeManager.translate("home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            //activeIcon: Icon(Icons.search),
            label: localeManager.translate("explore"),
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(), // A placeholder for the FAB space
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined),
            //activeIcon: Icon(Icons.list),
            label: localeManager.translate("watchList"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            //activeIcon: Icon(Icons.person_2),
            label: localeManager.translate("profile"),
          ),
        ],
      ),
    );
  }
}
