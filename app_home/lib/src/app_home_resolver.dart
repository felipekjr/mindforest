import 'package:common_deps/common_deps.dart';
import 'package:common_quiz/common_quiz.dart';
import 'package:core/core.dart';


import 'presentation/presentation.dart';

class AppHomeResolver implements MicroApp {
  @override
  String get name => 'home';

  @override
  void registerServices() {
    GetIt.I.registerSingleton<HomeController>(HomeController());
    GetIt.I.registerSingleton<HistoryController>(HistoryController(
      getQuiz: makeGetQuiz()
    ));
  }

  @override
  Map<String, WidgetBuilderArgs> get routes => {
    name: (context, args) => const HomePage(),
    Routes.history: (context, args) => const HistoryPage()
  };

}