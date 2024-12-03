import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String stremail,String strpassword) async {
    try {
      // Create the user using FirebaseAuth
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: stremail,
        password: strpassword,
      );

      // Return the user instance after successful creation
      return credential.user;

    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }

  // Function to login with email and password
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    try {
      // Attempt to sign in the user with Firebase Authentication
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Return the user if successful
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific exceptions
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Incorrect password.');
      } else {
        throw Exception(e.message ?? 'An error occurred.');
      }
    } catch (e) {
      // Handle general exceptions
      throw Exception('An unexpected error occurred.');
    }
  }

  // Method to sign out the current user
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception('Error signing out: $e');
    }
  }
  
  // function that uses Firebase's built-in method to send a password reset email to the user
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception('Failed to send password reset email: $e');
    }
  }

  
  Future<int> checkUserAuthStatus() async{
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("User is not signed in.");
      return 0;
    } else {
      print("User is signed in: ${user.email}");
      return 1;
    }
  }
}
