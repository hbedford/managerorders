import 'package:flutter/material.dart';
import 'package:managerorders/data/factories/pages/home/home_presenter.dart';

import 'orders_in_progress_widgets.dart';

class OrdersWidget extends StatelessWidget {
  final HomePresenter presenter;
  OrdersWidget({@required this.presenter});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraint) => Column(
        children: [
          Container(
              height: constraint.maxHeight * 0.1,
              child: ValueListenableBuilder(
                valueListenable: presenter.menuSelected,
                builder: (_, value, child) => Row(
                  children: [
                    Flexible(
                        child: InkWell(
                      onTap: () => presenter.changeMenuSelected(0),
                      child: Container(
                          color: value == 0 ? Colors.white : Colors.grey,
                          child: Center(child: Text('Pedidos em andamento'))),
                    )),
                    Flexible(
                        child: InkWell(
                      onTap: () => presenter.changeMenuSelected(1),
                      child: Container(
                          color: value == 1 ? Colors.white : Colors.grey,
                          child: Center(child: Text('Pedidos finalizados'))),
                    ))
                  ],
                ),
              )),
          Expanded(
              child: ValueListenableBuilder(
            valueListenable: presenter.orders,
            builder: (_, value, child) => OrdersInProgressWidgets(
              orders: value,
            ),
          ))
        ],
      ),
    );
  }
}
