import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:managerorders/domain/entities/account_entity.dart';
import 'package:meta/meta.dart';

class AccountModel extends AccountEntity {
  AccountModel(
      {@required String uid,
      @required String name,
      @required String email,
      @required String companyName})
      : super(uid: uid, name: name, email: email, companyName: companyName);
  AccountModel.fromFirebase(DocumentSnapshot doc)
      : super(
            uid: doc.id,
            email: doc.data()['email'],
            name: doc.data()['name'],
            companyName: doc.data()['companyName']);
}
