import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:managerorders/presentation/presenters/getx_login_presenter.dart';

import 'login_presenter.dart';

LoginPresenter makeGetxLoginPresenter() =>
    GetxLoginPresenter(firebase: FirebaseFirestore.instance);
