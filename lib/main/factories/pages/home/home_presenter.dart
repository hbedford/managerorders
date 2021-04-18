import 'package:managerorders/domain/entities/account_entity.dart';

abstract class HomePresenter {
  Stream<int> get menuSelected;
  Stream<AccountEntity> get account;
  void changeMenuSelected(int value);
}
