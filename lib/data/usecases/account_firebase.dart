import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:managerorders/data/models/account_model.dart';
import 'package:managerorders/domain/entities/account_entity.dart';
import 'package:managerorders/domain/usecases/account_data.dart';
import 'package:meta/meta.dart';

class AccountFirebase extends AccountData {
  final FirebaseFirestore firebase;
  AccountFirebase({@required this.firebase});
  Future<AccountEntity> addAccountData(User user) async {
    DocumentReference ref = firebase.collection('users').doc(user.uid);
    final bool userExists = !await ref.snapshots().isEmpty;
    var data = {
      'uid': user.uid,
      'email': user.email,
      'name': user.displayName,
    };
    if (!userExists && user.photoURL != null) {
      data['photoUrl'] = user.photoURL;
    }
    ref.set(data);
    final DocumentSnapshot currentDocument = await ref.get();
    return AccountModel.fromFirebase(currentDocument);
  }

  @override
  Future<AccountEntity> getAccountData(User user) async {
    DocumentReference ref = firebase.collection('users').doc(user.uid);
    DocumentSnapshot doc = await ref.get();
    if (doc.exists)
      return AccountModel.fromFirebase(doc);
    else
      return addAccountData(user);
  }
}
