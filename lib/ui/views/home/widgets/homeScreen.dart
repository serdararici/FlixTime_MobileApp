import 'package:carousel_slider/carousel_slider.dart';
import 'package:flix_time/utils/constants/colors.dart';
import 'package:flix_time/utils/constants/text_Strings.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<String> imageList = [
    'https://via.placeholder.com/400x200',
    'https://via.placeholder.com/400x200/FF0000/FFFFFF',
    'https://via.placeholder.com/400x200/00FF00/000000',
    'https://via.placeholder.com/400x200/0000FF/FFFFFF',
    'https://via.placeholder.com/400x200/FF5566/FFFFFF',
    'https://via.placeholder.com/400x200/002266/000000',
    'https://via.placeholder.com/400x200/FF4455/FFFFFF',
  ];

  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(FTexts.appName)),
      body: Column(
        children: [
          // Carousel Slider
          CarouselSlider(
            items: imageList.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    decoration: BoxDecoration(
                      color: FColors.primary,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        item,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
            carouselController: _carouselController,
            options: CarouselOptions(
              height: 200.0,
              enlargeCenterPage: true,
              autoPlay: true,
              viewportFraction: 0.4,
              aspectRatio: 16 / 9,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          const SizedBox(height: 16),
          // Smooth Page Indicator
          SmoothPageIndicator(
            controller: PageController(initialPage: _currentIndex), // Workaround for integration
            count: imageList.length,
            effect: ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: FColors.primary,
              dotColor: Colors.grey.withOpacity(0.5),
            ),
            onDotClicked: (index) {
              _carouselController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
          ),
          const SizedBox(height: 20),
          // Example Button
          ElevatedButton(
            onPressed: () {
              print("Button clicked!");
            },
            child: const Text("First"),
          ),
        ],
      ),
    );
  }
}
