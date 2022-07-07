import 'package:common_deps/common_deps.dart';
import 'package:core/micro_app.dart';
import 'package:core/micro_core_utils.dart';
import 'package:core/routes.dart';

import 'presentation/presentation.dart';

class AppHomeResolver implements MicroApp {
  @override
  String get name => 'home';

  @override
  void registerServices() {
    GetIt.I.registerSingleton<HomeController>(HomeController());
    GetIt.I.registerSingleton<HistoryController>(HistoryController());
  }

  @override
  Map<String, WidgetBuilderArgs> get routes => {
    name: (context, args) => const HomePage(),
    Routes.history: (context, args) => const 
  };

}