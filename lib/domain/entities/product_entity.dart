import 'ingredient_entity.dart';
import 'package:meta/meta.dart';

abstract class ProductEntity {
  final String uid;
  final String title;
  final String description;
  final String image;
  final List<IngredientEntity> ingredients;
  ProductEntity({
    @required this.uid,
    @required this.title,
    @required this.description,
    @required this.image,
    @required this.ingredients,
  });
}
