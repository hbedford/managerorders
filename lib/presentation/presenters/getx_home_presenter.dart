import 'package:get/get.dart';
import 'package:managerorders/main/factories/pages/home/home_presenter.dart';

class GetxHomePresenter extends GetxController implements HomePresenter {
  final _menuSelected = RxInt(0);
  Stream<int> get menuSelected => _menuSelected.stream;
}
