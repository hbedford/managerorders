import 'package:firebase_auth/firebase_auth.dart';

abstract class GoogleSignInAuth {
  Future<User> signInSilently();
  Future<User> signIn();
  Future<void> signOutUser();
  User getCurrentUser();
  bool isLoggedIn();
}
