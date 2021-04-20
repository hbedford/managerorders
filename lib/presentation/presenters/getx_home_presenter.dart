import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:managerorders/domain/entities/account_entity.dart';
import 'package:managerorders/data/factories/pages/home/home_presenter.dart';
import 'package:managerorders/domain/entities/order_entity.dart';

class GetxHomePresenter extends GetxController implements HomePresenter {
  final _menuSelected = ValueNotifier<int>(0);
  final _menuLeftSelected = ValueNotifier<int>(0);
  var _account = ValueNotifier<AccountEntity>(null);
  final _orders = ValueNotifier<List<OrderEntity>>([]);
  ValueNotifier<int> get menuSelected => _menuSelected;
  ValueNotifier<int> get menuLeftSelected => _menuLeftSelected;
  ValueNotifier<List<OrderEntity>> get orders => _orders;
  GetxHomePresenter();
  void loadData() {
    _account.value = Get.arguments;
  }

  ValueNotifier<AccountEntity> get account => _account;
  void changeMenuSelected(int value) => _menuSelected.value = value;
  void changeMenuLeftSelected(int value) => _menuLeftSelected.value = value;
}
