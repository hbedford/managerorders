import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerorders/data/factories/pages/home/home_page_factory.dart';
import 'package:managerorders/data/factories/pages/login/login_page_factory.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: makeLoginPage),
        GetPage(name: '/home', page: makeHomePage)
      ],
    );
  }
}
