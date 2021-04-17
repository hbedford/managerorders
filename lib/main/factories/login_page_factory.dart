import 'package:flutter/material.dart';
import 'package:managerorders/ui/pages/login/login_page.dart';

import 'getx_login_presenter_factory.dart';

Widget makeLoginPage() => LoginPage(presenter: makeGetxLoginPresenter());
