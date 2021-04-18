import 'package:get/get.dart';
import 'package:managerorders/domain/entities/account_entity.dart';
import 'package:managerorders/main/factories/pages/home/home_presenter.dart';

class GetxHomePresenter extends GetxController implements HomePresenter {
  final _menuSelected = RxInt(0);
  final _account = Rx<AccountEntity>(null);
  Stream<int> get menuSelected => _menuSelected.stream;
  Stream<AccountEntity> get account => _account.stream;
  void changeMenuSelected(int value) {
    _menuSelected.value = value;
  }
}
