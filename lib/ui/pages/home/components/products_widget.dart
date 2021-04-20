import 'package:flutter/material.dart';
import 'package:managerorders/data/factories/pages/home/home_presenter.dart';

import 'products_list_widget.dart';

class ProductsWidget extends StatelessWidget {
  final HomePresenter presenter;
  ProductsWidget({@required this.presenter});
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
                          child: Center(child: Text('Produtos ativados'))),
                    )),
                    Flexible(
                        child: InkWell(
                      onTap: () => presenter.changeMenuSelected(1),
                      child: Container(
                          color: value == 1 ? Colors.white : Colors.grey,
                          child: Center(child: Text('Produtos ocultos'))),
                    ))
                  ],
                ),
              )),
          Expanded(
              child: ValueListenableBuilder(
            valueListenable: presenter.orders,
            builder: (_, value, child) => ProductsListWidget(
              products: value,
            ),
          ))
        ],
      ),
    );
  }
}
