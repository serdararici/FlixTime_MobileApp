import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  int _currentIndex = 0;

  final List<String> moviePosters = [
    'assets/movie1.jpg',
    'assets/movie2.jpg',
    'assets/movie3.jpg',
    'assets/movie4.jpg',
    'assets/movie5.jpg',
    'assets/movie6.jpg',
    'assets/movie7.jpg',
    'assets/movie8.jpg',
    'assets/movie9.jpg',
    'assets/movie10.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: moviePosters.length,
            itemBuilder: (context, index, realIndex) {
              bool isCurrent = index == _currentIndex;
              bool isLeft = index == _currentIndex - 1 || (index == moviePosters.length - 1 && _currentIndex == 0);
              bool isRight = index == _currentIndex + 1 || (index == 0 && _currentIndex == moviePosters.length - 1);

              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 8),
                curve: Curves.easeInOut,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    moviePosters[index],
                    fit: BoxFit.cover,
                    width: isCurrent ? 250 : isLeft || isRight ? 150 : 120,
                    height: 200,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 220.0,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlay: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          SizedBox(height: 8),
          // Dot indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(moviePosters.length, (index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: _currentIndex == index ? 12 : 8,
                height: _currentIndex == index ? 12 : 8,
                decoration: BoxDecoration(
                  color: _currentIndex == index ? Colors.orange : Colors.grey,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
