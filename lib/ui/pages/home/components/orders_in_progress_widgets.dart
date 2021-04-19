import 'package:flutter/material.dart';
import 'package:managerorders/domain/entities/order_entity.dart';

class OrdersInProgressWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<OrderEntity>>(
      builder: (_, snapshot) => ListView.builder(
        itemBuilder: (context, int index) => ListTile(
          title: Text(snapshot.data[index].client),
          subtitle: Text(snapshot.data[index].date.hour.toString() +
              ':' +
              snapshot.data[index].date.minute.toString()),
        ),
      ),
    );
  }
}
