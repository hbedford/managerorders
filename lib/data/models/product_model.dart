import 'package:managerorders/domain/entities/ingredient_entity.dart';
import 'package:managerorders/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

import 'ingredient_model.dart';

class ProductModel extends ProductEntity {
  ProductModel(
      {@required String uid,
      @required String title,
      @required String description,
      @required String image,
      @required List ingredients})
      : super(
            uid: uid,
            title: title,
            description: description,
            image: image,
            ingredients: ingredients);
  Map get toMap => {
        'title': title,
        'description': description,
        'image': image,
        'ingredients':
            ingredients.map((ingredient) => ingredient.toMap).toList()
      };
}
