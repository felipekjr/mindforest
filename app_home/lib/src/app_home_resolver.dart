import 'package:common_deps/common_deps.dart';
import 'package:core/micro_app.dart';
import 'package:core/micro_core_utils.dart';

import 'controllers/home_controller.dart';
import 'ui/pages/home_page.dart';

class AppHomeResolver implements MicroApp {
  @override
  String get name => 'home';

  @override
  void registerServices() {
    GetIt.I.registerSingleton<HomeController>(HomeController());
  }

  @override
  Map<String, WidgetBuilderArgs> get routes => {
    name: (context, args) => const HomePage()
  };

}