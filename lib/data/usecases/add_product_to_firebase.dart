import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:managerorders/domain/entities/product_entity.dart';
import 'package:managerorders/domain/usecases/add_product.dart';
import 'package:meta/meta.dart';

class AddProductToFirebase implements AddProduct {
  final FirebaseFirestore firebase;
  AddProductToFirebase({@required this.firebase});
  Future<bool> add(ProductEntity product) async {
    DocumentReference doc = await firebase.collection('products').add(
        AddProductParams(
                title: product.title,
                description: product.description,
                image: product.image,
                ingredients: product.ingredients)
            .toMap);
    if (doc.id != null) {
      return true;
    } else
      return false;
  }
}
