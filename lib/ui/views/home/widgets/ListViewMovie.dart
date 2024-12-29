import 'package:flutter/material.dart';

import '../../../../data/entity/movie.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class ListViewMovie extends StatelessWidget {
  const ListViewMovie({
    super.key, required this.movieList,
  });

  final List<Movie> movieList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          final movie = movieList[index];
          return Container(
            width: 150,
            decoration: BoxDecoration(
              color: FColors.transparent,
              borderRadius: BorderRadius.circular(FSizes.borderRadiusLg),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(FSizes.borderRadiusLg),
                  child: Image.network(
                    movie.movieImageUrl, width: 200, height: 200, fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) =>
                    const Center(
                      child: Icon(Icons.error, size: 50, color: Colors.red),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(movie.movieName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text('Rating: ${movie.movieRating}', style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          );
        },
      ),
    );
  }
}