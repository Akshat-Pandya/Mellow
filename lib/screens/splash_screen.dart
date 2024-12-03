import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to WelcomeScreens after a delay of 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/welcome');
    });

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF), // Soft cream background
        ),
        child: Stack(
          children: [
            // Centered logo
            Center(
              child: Image.asset(
                'assets/images/applogo.png',
                width: 250, // Adjust logo size as needed
                height: 250,
              ),
            ),
            // Tagline at the bottom
            Positioned(
              bottom: 32, // Padding from bottom
              left: 0,
              right: 0,
              child: Text(
                'Discover Serenity Within...',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
