import 'package:FlixTime/ui/views/explore/widgets/detailsTitleRow.dart';
import 'package:FlixTime/ui/views/explore/widgets/movieDetailsHeader.dart';
import 'package:FlixTime/utils/constants/colors.dart';
import 'package:FlixTime/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/entity/movie.dart';
import '../../../utils/localization/localization_manager.dart';
import '../../../utils/theme/theme_manager.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key, required this.movie});

  final Movie movie;

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  bool _isScrolled = false;

  //when fetch data from api delete this list
  final List<String> categories = ["Action", "Comedy", "Drama", "Sci-Fi", "Horror"];

  final List<String> cast = [
    "John Doe",
    "Jane Smith",
    "Mike Johnsonkkkkkkkkkkkkkkkkkkkkkkk",
    "Emily Davis",
    "Chris Brown"
  ];

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final localeManager = Provider.of<LocaleManager>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          widget.movie.movieName,
          style: TextStyle(
            color: _isScrolled ? (isDarkMode ? FColors.white : FColors.dark) : Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: _isScrolled ? (isDarkMode ? FColors.dark : FColors.white) : Colors.transparent,
        elevation: _isScrolled ? 4.0 : 0.0,
        iconTheme: IconThemeData(
          color: _isScrolled ? (isDarkMode ? FColors.white : FColors.dark) : Colors.white,
        ),
        toolbarTextStyle: TextStyle(
          color: _isScrolled ? (isDarkMode ? FColors.white : FColors.dark) : Colors.white,
        ),
      ),

      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification.metrics.axis == Axis.vertical) {
            setState(() {
              _isScrolled = notification.metrics.pixels > (MediaQuery.of(context).size.height / 5) * 1;
            });
          }
          return false;
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieDetailsHeader(movie: widget.movie),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: FSizes.md, vertical: FSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.movie.movieName,
                      style: Theme.of(context).textTheme.headlineLarge?.apply(color: FColors.primary),
                    ),
                    const SizedBox(height: FSizes.sm),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, size: FSizes.iconSm, color: FColors.amber),
                            SizedBox(width: FSizes.xs),
                            Text(
                              widget.movie.movieRating.toString(),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        SizedBox(width: FSizes.md,),
                        Text("1994", style: Theme.of(context).textTheme.bodySmall),
                        SizedBox(width: FSizes.sm,),
                        Text("13+", style: Theme.of(context).textTheme.bodySmall),
                        SizedBox(width: FSizes.sm,),
                        Text("2h 22m", style: Theme.of(context).textTheme.bodySmall)
                      ],
                    ),
                    const SizedBox(height: FSizes.md),
                    Text(
                      'Film hakkında detaylı bilgi buraya gelecek...kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk'
                          'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk'
                          'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: FSizes.md),
                    SizedBox(
                      height: 35,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        separatorBuilder: (context, index) => SizedBox(width: FSizes.sm),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: FSizes.lg, vertical: FSizes.sm),
                            decoration: BoxDecoration(
                              color: FColors.dark.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(FSizes.borderRadiusLg),
                            ),
                            child: Center(
                              child: Text(
                                categories[index],
                                style: Theme.of(context).textTheme.bodySmall!.apply(color: FColors.white),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: FSizes.md,),
                    DetailsTitleRow(title: localeManager.translate("cast")),
                    SizedBox(height: FSizes.sm,),
                    _castListRow(),
                    SizedBox(height: FSizes.md,),
                    SizedBox(height: 500,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _castListRow() {
    return Container(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: cast.length,
        separatorBuilder: (context, index) => const SizedBox(width: 20,),
        itemBuilder: (context, index) {
          var item = cast[index];
          return Column(
            children: [
              ClipOval(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    /*
                    image: DecorationImage(
                      image: NetworkImage(item['iconPath']!), // Resim yolu
                      fit: BoxFit.cover, // Görüntü dolgusunu sağlıyoruz
                    ),

                     */
                    color: FColors.dark,
                  ),
                ),
              ),
              SizedBox(height: FSizes.sm),
              SizedBox(
                width: 80,
                child: Text(
                  item,
                  style: Theme.of(context).textTheme.labelLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


