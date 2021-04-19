import 'package:managerorders/domain/entities/ingredient_entity.dart';
import 'package:managerorders/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

abstract class AddProduct {
  Future<bool> add(ProductEntity product);
}

class AddProductParams {
  final String title;
  final String description;
  final String image;
  final List<IngredientEntity> ingredients;
  Map get toMap => {
        'title': title,
        'description': description,
        'image': image,
        'ingredients': ingredients
            .map((ingredient) => IngredientParams(
                    title: ingredient.title, amount: ingredient.amount)
                .toMap)
            .toList()
      };
  AddProductParams(
      {@required this.title,
      @required this.description,
      @required this.image,
      @required this.ingredients});
}

class IngredientParams {
  final String title;
  final int amount;
  Map get toMap => {'title': title, 'amount': amount};
  IngredientParams({@required this.title, @required this.amount});
}
