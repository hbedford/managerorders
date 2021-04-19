import 'package:meta/meta.dart';

abstract class IngredientEntity {
  final String title;
  final int amount;
  IngredientEntity({@required this.title, @required this.amount});
  Map get toMap => {'title': title, 'amount': amount};
}
