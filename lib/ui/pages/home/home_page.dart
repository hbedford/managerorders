import 'package:flutter/material.dart';
import 'package:managerorders/domain/entities/account_entity.dart';
import 'package:managerorders/main/factories/pages/home/home_presenter.dart';

class HomePage extends StatelessWidget {
  final HomePresenter presenter;
  HomePage({@required this.presenter});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: StreamBuilder<AccountEntity>(
        stream: presenter.account,
        builder: (context, account) =>
            account.hasData ? Text(account.data.name) : Container(),
      ),
    ));
  }
}
