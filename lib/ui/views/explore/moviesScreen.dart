import 'package:FlixTime/data/entity/movie.dart';
import 'package:FlixTime/ui/views/explore/widgets/movieGridView.dart';
import 'package:FlixTime/ui/views/explore/widgets/moviesTitleRow.dart';
import 'package:FlixTime/utils/constants/colors.dart';
import 'package:FlixTime/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/customSearchBar.dart';
import '../../../utils/localization/localization_manager.dart';
import '../../../utils/theme/theme_manager.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final localeManager = Provider.of<LocaleManager>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(FSizes.md),
        child: Column(
        children: [
          CustomSearchBar(),
          SizedBox(height: FSizes.md,),
          MoviesTitleRow(title: localeManager.translate("recommendedMovies"),),
          MovieGridView(movieItems: movieList,),
        ]
        ),
      ),
    );
  }
}






