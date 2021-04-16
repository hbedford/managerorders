import 'package:meta/meta.dart';

abstract class IngredientEntity {
  final String uid;
  final String title;
  final int amount;
  IngredientEntity(
      {@required this.uid, @required this.title, @required this.amount});
}
