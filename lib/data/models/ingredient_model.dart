import 'package:managerorders/domain/entities/ingredient_entity.dart';
import 'package:meta/meta.dart';

class IngredientModel extends IngredientEntity {
  IngredientModel({@required String title, @required int amount})
      : super(title: title, amount: amount);
  Map get toMap => {'title': title, 'amount': amount};
}
