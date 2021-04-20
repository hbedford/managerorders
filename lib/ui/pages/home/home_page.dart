import 'package:flutter/material.dart';
import 'package:managerorders/domain/entities/account_entity.dart';
import 'package:managerorders/data/factories/pages/home/home_presenter.dart';

import 'components/orders_widget.dart';
import 'components/products_widget.dart';

class HomePage extends StatelessWidget {
  final HomePresenter presenter;
  HomePage({@required this.presenter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder<AccountEntity>(
          valueListenable: presenter.account,
          builder: (_, value, child) => Text(value.name),
        ),
      ),
      body: Builder(builder: (context) {
        presenter.loadData();
        return SafeArea(
          child: Row(
            children: [
              RailNavigator(
                presenter: presenter,
              ),
              VerticalDivider(thickness: 1, width: 1),
              Expanded(
                  flex: 8,
                  child: ValueListenableBuilder(
                    valueListenable: presenter.menuLeftSelected,
                    builder: (_, value, child) {
                      if (value == 0)
                        return OrdersWidget(
                          presenter: presenter,
                        );
                      else
                        return ProductsWidget(
                          presenter: presenter,
                        );
                    },
                  )),
            ],
          ),
        );
      }),
    );
  }
}

class RailNavigator extends StatelessWidget {
  final HomePresenter presenter;
  RailNavigator({@required this.presenter});
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ValueListenableBuilder(
        valueListenable: presenter.menuLeftSelected,
        builder: (_, value, child) => NavigationRail(
          selectedIndex: value,
          onDestinationSelected: presenter.changeMenuLeftSelected,
          labelType: NavigationRailLabelType.selected,
          destinations: [
            NavigationRailDestination(
              icon: Icon(Icons.pending_actions),
              selectedIcon: Icon(Icons.pending_actions),
              label: Text('Pedidos'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.bookmark),
              selectedIcon: Icon(Icons.bookmark),
              label: Text('Produtos'),
            ),
          ],
        ),
      ),
    );
  }
}
