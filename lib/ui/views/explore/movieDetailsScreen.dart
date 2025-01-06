import 'package:FlixTime/ui/views/explore/widgets/movieDetailsHeader.dart';
import 'package:FlixTime/utils/constants/colors.dart';
import 'package:FlixTime/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../data/entity/movie.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          widget.movie.movieName,
        ),
        centerTitle: true,
        backgroundColor: _isScrolled ?  FColors.dark : Colors.transparent,
        elevation: _isScrolled ? 4.0 : 0.0,

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
                      style: Theme.of(context).textTheme.headlineMedium?.apply(color: FColors.primary),
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
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                              decoration: BoxDecoration(
                                color: FColors.dark.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text(
                                  categories[index],
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
