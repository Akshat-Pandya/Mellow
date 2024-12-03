import 'package:firebase_auth/firebase_auth.dart';

class Utility {
  // Static fields to store user credentials
  static String _userEmail = '';
  static String _userId = '';

  // Method to save user credentials (email and userId)
  static void saveUserCredentials(User user) {
    _userEmail = user.email ?? ''; // Store email
    _userId = user.uid; // Store user ID
  }

  // Getter to access the stored email
  static String get userEmail => _userEmail;

  // Getter to access the stored userId
  static String get userId => _userId;
}
