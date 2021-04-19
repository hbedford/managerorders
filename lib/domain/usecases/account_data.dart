import 'package:firebase_auth/firebase_auth.dart';
import 'package:managerorders/domain/entities/account_entity.dart';

abstract class AccountData {
  Future<AccountEntity> getAccountData(User user);
  Future<AccountEntity> addAccountData(User user);
}
