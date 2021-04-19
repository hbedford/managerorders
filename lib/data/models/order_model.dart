import 'package:managerorders/domain/entities/order_entity.dart';
import 'package:managerorders/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    @required String uid,
    @required String name,
    @required String client,
    @required String description,
    @required DateTime date,
    @required List<ProductEntity> products,
  }) : super(
            uid: uid,
            client: client,
            date: date,
            description: description,
            products: products);
}
