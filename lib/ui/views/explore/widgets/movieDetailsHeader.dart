import 'package:FlixTime/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../data/entity/movie.dart';
import '../../../../utils/constants/colors.dart';

class MovieDetailsHeader extends StatelessWidget {
  const MovieDetailsHeader({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (MediaQuery.of(context).size.height / 5) * 2,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 1.0,
            child: ClipRRect(
              child: Image.network(
                movie.movieImageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [
                  FColors.black.withOpacity(0.8),
                  FColors.black.withOpacity(0.0),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  FColors.darkBackground.withOpacity(0.0),
                  FColors.darkBackground.withOpacity(1.0),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(FSizes.md),
              child: Card(
                elevation: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(FSizes.borderRadiusMd),
                  child: Image.network(
                    movie.movieImageUrl,
                    height: 220,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}