import 'package:flutter/material.dart';
import 'package:managerorders/domain/entities/account_entity.dart';
import 'package:managerorders/data/factories/pages/home/home_presenter.dart';

import 'components/orders_in_progress_widgets.dart';

class HomePage extends StatelessWidget {
  final HomePresenter presenter;
  HomePage({@required this.presenter});
  @override
  Widget build(BuildContext context) {
    presenter.loadData();
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<AccountEntity>(
          stream: presenter.account,
          builder: (context, account) =>
              account.hasData ? Text(account.data.name) : Container(),
        ),
      ),
      body: LayoutBuilder(
        builder: (_, constraint) => Column(
          children: [
            Container(
              height: constraint.maxHeight * 0.1,
              child: Row(
                children: [
                  Flexible(
                      child: Container(
                          color: Colors.white,
                          child: Center(child: Text('Pedidos em andamento')))),
                  Flexible(
                      child: Container(
                          color: Colors.grey,
                          child: Center(child: Text('Pedidos finalizados'))))
                ],
              ),
            ),
            Expanded(child: OrdersInProgressWidgets())
          ],
        ),
      ),
    );
  }
}
