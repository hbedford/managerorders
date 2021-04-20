import 'package:flutter/material.dart';
import 'package:managerorders/domain/entities/account_entity.dart';
import 'package:managerorders/data/factories/pages/home/home_presenter.dart';

import 'components/orders_in_progress_widgets.dart';

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
                child: LayoutBuilder(
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
                                      color: value == 0
                                          ? Colors.white
                                          : Colors.grey,
                                      child: Center(
                                          child: Text('Pedidos em andamento'))),
                                )),
                                Flexible(
                                    child: InkWell(
                                  onTap: () => presenter.changeMenuSelected(1),
                                  child: Container(
                                      color: value == 1
                                          ? Colors.white
                                          : Colors.grey,
                                      child: Center(
                                          child: Text('Pedidos finalizados'))),
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
                ),
              ),
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
