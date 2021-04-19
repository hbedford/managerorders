import 'product_entity.dart';
import 'package:meta/meta.dart';

abstract class OrderEntity {
  final String uid;
  final String client;
  final String description;
  final DateTime date;
  final List<ProductEntity> products;
  OrderEntity({
    @required this.uid,
    @required this.client,
    @required this.date,
    @required this.description,
    @required this.products,
  });
}
