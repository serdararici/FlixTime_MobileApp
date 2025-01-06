import 'package:flutter/material.dart';

import '../../../../data/entity/movie.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../explore/movieDetailsScreen.dart';

class ListViewMovie extends StatelessWidget {
  const ListViewMovie({
    super.key,
    required this.movieList,
  });

  final List<Movie> movieList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: FSizes.sm),
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          final movie = movieList[index];
          return SizedBox(
            width: 160,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailsScreen(movie: movie),
                  ),
                );
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(FSizes.borderRadiusLg),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(FSizes.borderRadiusLg),
                      ),
                      child: Image.network(
                        movie.movieImageUrl,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) => const Center(
                          child: Icon(
                            Icons.error,
                            size: FSizes.iconLg,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(FSizes.sm),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.movieName,
                            style: TextStyle(
                              fontSize: FSizes.fontSizeMd,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: FSizes.xs),
                          Row(
                            children: [
                              const Icon(Icons.star, color: FColors.amber, size: FSizes.iconSm),
                              const SizedBox(width: FSizes.xs),
                              Text(
                                '${movie.movieRating}',
                                style: TextStyle(fontSize: FSizes.fontSizeSm, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
