import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

class GoogleSignInMock extends Mock implements GoogleSignIn {}

class GoogleSignInAccountMock extends Mock implements GoogleSignInAccount {}

class GoogleSignInAuthenticationMock extends Mock
    implements GoogleSignInAuthentication {
  @override
  String get accessToken => 'mock_access_token';
  @override
  String get idToken => 'mock_id_token';
}

class AuthCredentialMock extends Mock implements AuthCredential {}

class FirebaseUserMock extends Mock implements User {
  @override
  String get displayName => 'Hugo Bedford';
  @override
  String get uid => 'uid';
  @override
  String get email => 'hugobedford@email.com';
  @override
  String get photoUrl => 'http://www.google.com';
}
