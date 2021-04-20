import 'package:flutter/material.dart';
import 'package:managerorders/domain/entities/product_entity.dart';

class ProductsListWidget extends StatelessWidget {
  final List<ProductEntity> products;
  ProductsListWidget({@required this.products});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, int index) => ListTile(
              title: Text(
                products[index].title,
              ),
              subtitle: Text(products[index].description),
            ));
  }
}
