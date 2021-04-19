import 'package:flutter/material.dart';
import 'package:managerorders/data/factories/pages/login/login_presenter.dart';

class LoginPage extends StatelessWidget {
  final LoginPresenter presenter;
  LoginPage({@required this.presenter});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: presenter.loginWithGoogle,
            child: Text('Logar com Google')),
      ),
    );
  }
}
