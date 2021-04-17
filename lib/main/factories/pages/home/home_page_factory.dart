import 'package:flutter/material.dart';
import 'package:managerorders/main/factories/pages/home/getx_home_presenter_factory.dart';
import 'package:managerorders/ui/pages/home/home_page.dart';

Widget makeHomePage() => HomePage(presenter: makeGetxHomePresenter());
