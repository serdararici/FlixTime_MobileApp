import 'package:FlixTime/data/entity/movie.dart';
import 'package:FlixTime/ui/cubit/movieScreenCubit.dart';
import 'package:FlixTime/ui/views/explore/widgets/movieGridView.dart';
import 'package:FlixTime/ui/views/explore/widgets/moviesTitleRow.dart';
import 'package:FlixTime/utils/constants/colors.dart';
import 'package:FlixTime/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MovieScreenCubit>().getAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final localeManager = Provider.of<LocaleManager>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(FSizes.sm),
        child: Column(
          children: [
            // Diğer widget'lar her durumda gösterilir
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: FSizes.sm),
              child: CustomSearchBar(),
            ),
            SizedBox(height: FSizes.md),
            //MoviesTitleRow(title: localeManager.translate("recommendedMovies")),
            BlocBuilder<MovieScreenCubit, List<Movie>>(
              builder: (context, movieList) {
                final cubit = context.read<MovieScreenCubit>();
                if (cubit.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (movieList.isEmpty && cubit.hasError) {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height/2,
                    child: Center(
                      child: Text(localeManager.translate("errorLoadingMovies")),
                    ),
                  );
                }
                if(movieList.isEmpty) {
                  return SizedBox(height: MediaQuery.of(context).size.height/2 , child: Center(child: Text(localeManager.translate("noMoviesAvailable"))));
                }
                if(movieList.isNotEmpty) {
                  return MovieGridView(movieItems: movieList);
                }
                return SizedBox(height: MediaQuery.of(context).size.height/2, child: Center(child: CupertinoActivityIndicator()));
              },
            ),
          ],
        ),
      ),
    );
  }

}






