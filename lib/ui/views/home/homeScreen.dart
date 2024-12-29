import 'package:carousel_slider/carousel_slider.dart';
import 'package:flix_time/data/entity/movie.dart';
import 'package:flix_time/ui/views/home/widgets/CustomCarousel.dart';
import 'package:flix_time/ui/views/home/widgets/ListViewMovie.dart';
import 'package:flix_time/ui/views/home/widgets/ListViewTitleRow.dart';
import 'package:flix_time/utils/constants/colors.dart';
import 'package:flix_time/utils/constants/sizes.dart';
import 'package:flix_time/utils/constants/text_Strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/localization/localization_manager.dart';
import '../../../utils/theme/theme_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<String> imageList = [
    'https://creativereview.imgix.net/content/uploads/2023/12/Oppenheimer.jpg?auto=compress,format&q=60&w=1263&h=2000',
    'https://images-cdn.ubuy.co.in/656f4b560f152f0af9695d25-joker-movie-poster-27-x-40-style-b.jpg',
    'https://assets.mubicdn.net/images/notebook/post_images/31857/images-w1400.jpg?1607290863',
    'https://preview.redd.it/whats-your-favorite-official-movie-poster-of-the-2020s-so-v0-wx8ohuwmb8xc1.jpeg?width=1000&format=pjpg&auto=webp&s=80893aeb0b94d5aa7a2f173363cc4cb66a53ab90',
  ];

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final localeManager = Provider.of<LocaleManager>(context);

    return Scaffold(
      appBar: AppBar(title: const Text(FTexts.appName)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(FSizes.md),
          child: Column(
            children: [
              CustomCarouselSlider(imageList: imageList),
              const SizedBox(height: FSizes.defaultSpace),
              ListViewTitleRow(title: localeManager.translate("newMovies"),),
              const SizedBox(height: FSizes.sm),
              ListViewMovie(movieList: movieList,),
              const SizedBox(height: FSizes.spaceBtwItems,),
              ListViewTitleRow(title: localeManager.translate("popularMovies"),),
              const SizedBox(height: FSizes.sm),
              ListViewMovie(movieList: movieList,),

              // Example Button
              ElevatedButton(
                onPressed: () {
                  print("Button clicked!");
                },
                child: const Text("First"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




