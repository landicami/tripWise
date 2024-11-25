import 'package:firebase_auth/firebase_auth.dart';
import 'package:tripwise/models/app_user.dart';

class AuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // sign up a new user
  static Future<AppUser?> signUp(String email, String password) async {
    try {
      final UserCredential credential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        return AppUser(
          uid: credential.user!.uid,
          email: credential.user!.email!,
        );
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // logging in
  static Future<AppUser?> signIn(String email, String password) async {
    try {
      final UserCredential credential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        return AppUser(
            uid: credential.user!.uid, email: credential.user!.email!);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

// forgot password
  static Future<void> forgotPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      // Handle any errors that occur during the password reset process
      print('Error sending password reset email: $e');
      throw e;
    }
  }

  // logging out
  static Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
