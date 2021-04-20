import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:managerorders/domain/entities/account_entity.dart';
import 'package:managerorders/domain/entities/order_entity.dart';

abstract class HomePresenter {
  ValueNotifier<int> get menuSelected;
  ValueNotifier<int> get menuLeftSelected;
  ValueNotifier<List<OrderEntity>> get orders;
  ValueNotifier<AccountEntity> get account;
  void changeMenuSelected(int value);
  void changeMenuLeftSelected(int value);
  void loadData();
}
