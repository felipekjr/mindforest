
import 'package:app_login/src/presentation/controllers/login_controller.dart';
import 'package:common_deps/common_deps.dart';
import 'package:core/core.dart';

import 'presentation/pages/pages.dart';

class AppLoginResolver implements MicroApp {
  @override
  String get name => 'login';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
    name: (context, args) => LoginPage()
  };

  @override
  void registerServices() {
    GetIt.I.registerSingleton<LoginController>(LoginController());
  }

}