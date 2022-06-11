
import 'package:app_login/src/presentation/controllers/login_controller.dart';
import 'package:common_deps/common_deps.dart';
import 'package:core/micro_app.dart';
import 'package:core/micro_core_utils.dart';

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
    GetIt.instance.registerSingleton<LoginController>(LoginController());
  }

}