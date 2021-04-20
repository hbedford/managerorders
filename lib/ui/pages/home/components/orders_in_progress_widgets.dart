import 'package:flutter/material.dart';
import 'package:managerorders/domain/entities/order_entity.dart';

class OrdersInProgressWidgets extends StatelessWidget {
  final List<OrderEntity> orders;
  OrdersInProgressWidgets({@required this.orders});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, int index) => ListTile(
        title: Text(orders[index].client),
        subtitle: Text(orders[index].date.hour.toString() +
            ':' +
            orders[index].date.minute.toString()),
      ),
    );
  }
}
