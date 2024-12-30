import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flix_time/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/colors.dart';

class CustomCarouselSlider extends StatefulWidget {
  final List<String> imageList;

  const CustomCarouselSlider({required this.imageList, Key? key}) : super(key: key);

  @override
  _CustomCarouselSliderState createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Carousel Slider
        CarouselSlider(
          items: widget.imageList.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                    color: FColors.primary,
                    borderRadius: BorderRadius.circular(FSizes.borderRadiusXLg),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(FSizes.borderRadiusXLg),
                    child: Image.network(
                      item,
                      fit: BoxFit.cover,
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
                );
              },
            );
          }).toList(),
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 300.0,
            enlargeCenterPage: true,
            autoPlay: true,
            viewportFraction: 0.5,
            aspectRatio: 4 / 3,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: FSizes.spaceBtwItems,),
        // Smooth Page Indicator
        SmoothPageIndicator(
          controller: PageController(initialPage: _currentIndex),
          count: widget.imageList.length,
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
      ],
    );
  }
}
