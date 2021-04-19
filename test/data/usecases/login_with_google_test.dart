import 'package:managerorders/data/usecases/login_with_google.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../mock/firebase_auth_mock.dart';

void main() {
  group('WithGoogleSignIn', () {
    FirebaseAuthMock firebaseAuth = FirebaseAuthMock();
    GoogleSignInMock googleSignIn = GoogleSignInMock();
    LoginWithGoogle loginWithGoogle =
        LoginWithGoogle(firebaseAuth: firebaseAuth, googleSignIn: googleSignIn);
    final GoogleSignInAccountMock googleSignInAccount =
        GoogleSignInAccountMock();
    final GoogleSignInAuthenticationMock googleSignInAuthentication =
        GoogleSignInAuthenticationMock();
    final FirebaseUserMock firebaseUser = FirebaseUserMock();
    test('SignInWithGoogle', () async {
      when(googleSignIn.signIn()).thenAnswer(
          (_) => Future<GoogleSignInAccountMock>.value(googleSignInAccount));
      when(googleSignInAccount.authentication).thenAnswer((_) =>
          Future<GoogleSignInAuthenticationMock>.value(
              googleSignInAuthentication));
      when(firebaseAuth.currentUser).thenAnswer((_) => firebaseUser);
      expect(await loginWithGoogle.signIn(), firebaseUser);
      verify(googleSignIn.signIn()).called(1);
      verify(googleSignInAccount.authentication).called(1);
    });
    test('getCurrentUser returns current user', () {
      when(firebaseAuth.currentUser).thenAnswer((_) => firebaseUser);
      expect(loginWithGoogle.getCurrentUser(), firebaseUser);
    });
    test('isLoggedIn return true only when FirebaseAuth has a user', () async {
      when(firebaseAuth.currentUser).thenAnswer((_) => firebaseUser);
      expect(loginWithGoogle.isLoggedIn(), true);
      when(firebaseAuth.currentUser).thenAnswer((_) => null);
      expect(loginWithGoogle.isLoggedIn(), false);
    });
  });
}
