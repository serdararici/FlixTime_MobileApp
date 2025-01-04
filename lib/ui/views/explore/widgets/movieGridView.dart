import 'package:flutter/material.dart';

import '../../../../data/entity/movie.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class MovieGridView extends StatefulWidget {
  const MovieGridView({
    super.key, required this.movieItems,
  });

  final List<Movie> movieItems;

  @override
  State<MovieGridView> createState() => _MovieGridViewState();
}

class _MovieGridViewState extends State<MovieGridView> {
  @override
  Widget build(BuildContext context) {
    // Screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Determine column count dynamically
    int crossAxisCount = screenWidth > 600 ? 5 : 3;

    // Calculate each object size
    double itemSize = (screenWidth - (40 * (crossAxisCount - 1))) / crossAxisCount;

    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
          mainAxisExtent: 200
        ),
        itemCount: widget.movieItems.length,
        itemBuilder: (context, index) {
          Movie movie = widget.movieItems[index];
          return Card(
            elevation: 5,
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(FSizes.md),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(FSizes.md)),
                        child: Image.network(
                          movie.movieImageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        movie.movieName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: FColors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(FSizes.borderRadiusMd),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, size: FSizes.iconSm, color: FColors.amber),
                        SizedBox(width: 4),
                        Text(
                          movie.movieRating.toString(),
                          style: TextStyle(color: FColors.white, fontSize: FSizes.fontSizeSm),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
      
      
      
      
      
      
      
      
          /*
          return Card(
            elevation: 5,
            color: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(FSizes.md),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(FSizes.md)),
                        child: Image.network(
                          movie.movieImageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        movie.movieName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: FColors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(FSizes.borderRadiusMd),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, size: FSizes.iconSm, color: FColors.amber),
                        SizedBox(width: 4),
                        Text(
                          movie.movieRating.toString(),
                          style: TextStyle(color: FColors.white, fontSize: FSizes.fontSizeSm),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
          */
        },
      ),
    );
  }
}