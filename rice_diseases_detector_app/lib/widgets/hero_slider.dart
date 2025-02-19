import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HeroSlider extends StatefulWidget {
  const HeroSlider({Key? key}) : super(key: key);

  @override
  State<HeroSlider> createState() => _HeroSliderState();
}

class _HeroSliderState extends State<HeroSlider> {
  final PageController _pageController = PageController();
  
  final List<SlideContent> _slides = [
    SlideContent(
      image: 'assets/images/SCAN.png',
      title: '\'Tell me phone, what\'s destroying my crops?\'',
      subtitle: 'The app Plantix was created by graduate students and scientists to help farmers address crop diseases, pest damage, and nutrient deficiencies.'

    ),
    SlideContent(
      image: 'assets/images/FAO.png',
      title: 'Early detection for a thriving harvest',
      subtitle: 'Lorem ipsum lorem ipsum lorem ipsum',
    ),
    SlideContent(
      image: 'assets/images/CHINA.png',
      title: 'Rice fields enter harvest season in east China',
      subtitle: 'Ensuring a better future for agriculture',
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: _slides.length,
                  itemBuilder: (context, index) {
                    return _buildSlide(_slides[index]);
                  },
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: _slides.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 5,
                        dotWidth: 5,
                        spacing: 5,
                        dotColor: Colors.white.withOpacity(0.5),
                        activeDotColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSlide(SlideContent slide) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          slide.image,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(color: Colors.grey);
          },
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.2),
                Colors.black.withOpacity(0.5),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                slide.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 2),
                      blurRadius: 4,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
             // const SizedBox(height: 0),
              Text(
                slide.subtitle,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 11,
                  shadows: const [
                    Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 2,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SlideContent {
  final String image;
  final String title;
  final String subtitle;

  SlideContent({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}