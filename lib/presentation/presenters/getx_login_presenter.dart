import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:managerorders/main/factories/login_presenter.dart';
import 'package:meta/meta.dart';

class GetxLoginPresenter extends GetxController implements LoginPresenter {
  FirebaseFirestore firebase;
  GetxLoginPresenter({@required this.firebase});
  Future<void> loginWithGoogle() {}
}
