import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/colors.dart';
import 'auth_signup.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Mellow",
              style: GoogleFonts.calligraffitti(
                textStyle: const TextStyle(
                  letterSpacing: 1.75,
                  fontSize: 28,
                  color: AppColors.background,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Heading: Login
            Text(
              'Login',
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 40),

            // Email input field
            TextField(
              decoration: InputDecoration(
                labelText: 'Email Address',
                labelStyle: TextStyle(color: Colors.grey[700]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary),
                ),
                prefixIcon: Icon(Icons.email, color: Colors.grey[700]),
              ),
            ),
            SizedBox(height: 16),

            // Password input field
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.grey[700]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary),
                ),
                prefixIcon: Icon(Icons.lock, color: Colors.grey[700]),
              ),
            ),
            SizedBox(height: 8),

            // Forgot Password link - Positioned to the bottom right of the password field
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  // Navigate to Forgot Password screen (to be implemented)
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),

            // Login button with secondary color
            ElevatedButton(
              onPressed: () {
                // Logic for Login will be implemented later
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: AppColors.secondary,
              ),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            SizedBox(height: 16),

            // Google Sign-In button
            ElevatedButton.icon(
              onPressed: () {
                // Logic for Google Sign-In will be implemented later
              },
              icon:GestureDetector(
                onTap: () {
                  // Logic for Google Sign-In will be implemented here
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/googlelogo.webp'), // Correct way to use image
                  radius: 18, // Adjust the size as needed
                  backgroundColor: Colors.transparent,
                ),
              ),
              label: Text(
                'Sign in with Google',
                style: TextStyle(
                  color: Colors.black, // Use black text color as per Google's button style
                  fontSize: 16,
                ),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, backgroundColor: Colors.transparent, minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ), // Make background transparent
                side: BorderSide(color: Colors.grey.shade300), // Text color when pressed
                elevation: 0, // No elevation
              ),
            ),


            SizedBox(height: 16),

            // Light grey colored "Don't have an account?" text
            Spacer(), // Push the "Don't have an account?" row to the bottom
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.grey),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to the Sign-Up screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  child: Text(
                    " Sign Up",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
