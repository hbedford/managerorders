import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:managerorders/data/usecases/account_firebase.dart';
import 'package:managerorders/domain/entities/account_entity.dart';
import 'package:managerorders/data/factories/pages/login/login_presenter.dart';
import 'package:managerorders/data/usecases/login_with_google.dart';
import 'package:meta/meta.dart';

class GetxLoginPresenter extends GetxController implements LoginPresenter {
  FirebaseFirestore firebase;
  GetxLoginPresenter({@required this.firebase});
  Future<void> loginWithGoogle() async {
    LoginWithGoogle loginWithGoogle = LoginWithGoogle(
        firebaseAuth: FirebaseAuth.instance, googleSignIn: GoogleSignIn());
    User user = await loginWithGoogle.signIn();
    if (user != null) {
      AccountFirebase accountFirebase =
          AccountFirebase(firebase: FirebaseFirestore.instance);
      AccountEntity accountInfo = await accountFirebase.getAccountData(user);
      if (accountInfo != null)
        Get.offAllNamed('/home', arguments: accountInfo);
      else
        Get.snackbar('Ops', 'Ocorreu algum erro');
    } else
      Get.snackbar('Ops', 'Ocorreu algum erro');
  }

  Future<void> googleSignInSilently() async {
    LoginWithGoogle loginWithGoogle = LoginWithGoogle(
        firebaseAuth: FirebaseAuth.instance, googleSignIn: GoogleSignIn());

    User user = await loginWithGoogle.signInSilently();
    if (user != null) {
      AccountFirebase accountFirebase =
          AccountFirebase(firebase: FirebaseFirestore.instance);
      AccountEntity accountInfo = await accountFirebase.getAccountData(user);
      if (accountInfo != null)
        Get.offAllNamed('/home', arguments: accountInfo);
      else
        Get.snackbar('Ops', 'Ocorreu algum erro');
    } else
      Get.snackbar('Ops', 'Ocorreu algum erro');
  }
}
