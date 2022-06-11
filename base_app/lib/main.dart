import 'package:app_groups/app_groups.dart';
import 'package:app_login/app_login.dart';
import 'package:common_deps/common_deps.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/base_app.dart';
import 'package:core/core.dart';
import 'package:core/micro_app.dart';
import 'package:core/micro_core_utils.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return ErrorOverlay(details: details);
  };
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MindForest());
}

class MindForest extends StatelessWidget with BaseApp {

  MindForest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    super.registerApps();

    return MaterialApp(
      title: 'MindForest',
      theme: CustomTheme.data,
      navigatorKey: navigatorKey,
      onGenerateRoute: super.generateRoute,
      initialRoute: Routes.login,
    );
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps => [
    AppLoginResolver(),
    AppGroupsResolver()
  ];
}