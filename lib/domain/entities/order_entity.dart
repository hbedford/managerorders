import 'acessory_entity.dart';
import 'product_entity.dart';
import 'package:meta/meta.dart';

abstract class OrderEntity {
  final String uid;
  final String title;
  final String description;
  final List<ProductEntity> products;
  final List<AcessoryEntity> acessories;
  OrderEntity({
    @required this.uid,
    @required this.title,
    @required this.description,
    @required this.products,
    @required this.acessories,
  });
}
