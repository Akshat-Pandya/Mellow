import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class WelcomeScreens extends StatefulWidget {
  const WelcomeScreens({super.key});

  @override
  State<WelcomeScreens> createState() => _WelcomeScreensState();
}

class _WelcomeScreensState extends State<WelcomeScreens> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  // List of welcome screens data
  final List<Map<String, String>> screens = const [
    {
      "title": "Welcome to Mellow",
      "description": "Discover your inner serenity and embark on a journey of self-discovery.",
      "image": "assets/images/selfdiscover.jpg",
    },
    {
      "title": "Connect with Like-Minded Souls",
      "description": "Chat and share your thoughts with people who truly understand you.",
      "image": "assets/images/chatting.webp",
    },
    {
      "title": "Set Goals and Achieve Them",
      "description": "Define your aspirations and let us guide you towards achieving them.",
      "image": "assets/images/goals.png",
    },
    {
      "title": "Mental Wellness & Exercises",
      "description": "Engage in tasks designed for mental well-being and inner peace.",
      "image": "assets/images/mentalhealth.webp",
    },
  ];

  // Navigate to Home Screen
  void _goToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login'); // Replace with your login route
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView for screens
          PageView.builder(
            controller: _pageController,
            itemCount: screens.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final screen = screens[index];
              return WelcomeScreen(
                title: screen['title']!,
                description: screen['description']!,
                imagePath: screen['image']!,
              );
            },
          ),
          // Dots Indicator
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: screens.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: Colors.pink,
                  dotColor: Colors.grey.shade400,
                ),
              ),
            ),
          ),
          // Skip or Continue Button
          Positioned(
            top: 50,
            right: 20,
            child: _currentIndex == screens.length - 1
                ? ElevatedButton(
              onPressed: () => _goToHome(context),
              child: const Text('CONTINUE'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )
                : ElevatedButton(
              onPressed: () => _goToHome(context),
              child: const Text('SKIP'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const WelcomeScreen({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Wide Image
        Image.asset(
          imagePath,
          width: double.infinity,
          height: 300,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 20),
        // Title
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        // Description
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}