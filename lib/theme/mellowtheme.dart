import 'package:flutter/material.dart';

class MellowTheme {
  static ThemeData getTheme() {
    return ThemeData(
      // Primary color (Soft Pink)
      primaryColor: Color(0xFFF07D9B),

      // Scaffold background color (Light Cream)
      scaffoldBackgroundColor: Color(0xFFF9F9F9),

      // Button Theme
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xFF4F9E9B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      // ElevatedButton Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Color(0xFF4F9E9B), // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        color: Color(0xFFF07D9B), // AppBar background color (Soft Pink)
        elevation: 4, // Optional: Elevation to give it a shadow
        iconTheme: IconThemeData(
          color: Colors.white, // White icons in AppBar
        ),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white, // White text for the AppBar title
        ),
      ),

      // Full Text Theme with appropriate styles
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: Color(0xFF333333),
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color(0xFF333333),
        ),
        displaySmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF333333),
        ),
        headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xFF333333),
        ),
        headlineMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Color(0xFF333333),
        ),
        headlineSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xFF333333),
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFF333333),
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF333333),
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF333333),
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          color: Color(0xFF333333),
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: Color(0xFF333333),
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          color: Color(0xFF9E9E9E),
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        labelMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        labelSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),

      // Card Theme (Optional)
      cardTheme: CardTheme(
        color: Color(0xFFF9F9F9),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
