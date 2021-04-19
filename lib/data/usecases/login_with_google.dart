import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:managerorders/domain/usecases/google_signin_auth.dart';
import 'package:meta/meta.dart';

class LoginWithGoogle extends GoogleSignInAuth {
  FirebaseAuth firebaseAuth;
  GoogleSignIn googleSignIn;
  LoginWithGoogle({@required this.firebaseAuth, @required this.googleSignIn});
  Future<User> signInSilently() async {
    try {
      GoogleSignInAccount account = await googleSignIn.signInSilently();
      GoogleSignInAuthentication authentication = await account.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: authentication.accessToken,
          idToken: authentication.idToken);

      await firebaseAuth.signInWithCredential(credential);
      final User user = firebaseAuth.currentUser;
      return user;
    } catch (e) {
      return null;
    }
  }

  Future<User> signIn() async {
    try {
      GoogleSignInAccount account = await googleSignIn.signIn();
      GoogleSignInAuthentication authentication = await account.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: authentication.accessToken,
          idToken: authentication.idToken);
      await firebaseAuth.signInWithCredential(credential);
      final User user = firebaseAuth.currentUser;
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> signOutUser() async {
    await Future.wait([firebaseAuth.signOut(), googleSignIn.signOut()]);
  }

  User getCurrentUser() {
    return firebaseAuth.currentUser;
  }

  bool isLoggedIn() {
    final user = firebaseAuth.currentUser;
    return user != null;
  }
}
