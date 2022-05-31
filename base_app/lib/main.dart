import 'package:common_ui/common_ui.dart';
import 'package:core/base_app.dart';
import 'package:core/micro_app.dart';
import 'package:core/micro_core_utils.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return ErrorOverlay(details: details);
  };
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MindForest());
}

class MindForest extends StatelessWidget with BaseApp {

  MindForest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.registerRoutes();

    return MaterialApp(
      title: 'MindForest',
      theme: CustomTheme.data,
      navigatorKey: navigatorKey,
      onGenerateRoute: super.generateRoute,
      initialRoute: '/user',
    );
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps => [
  ];
}