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
  // ErrorWidget.builder = (FlutterErrorDetails details) {
  //   return ErrorOverlay(details: details);
  // };
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MindForest());
}

class MindForest extends StatefulWidget {
  const MindForest({Key? key}) : super(key: key);

  @override
  State<MindForest> createState() => _MindForestState();
}

class _MindForestState extends State<MindForest> with BaseApp{
  @override
  void initState() {
    super.initState();
    super.registerServices();
  }

  @override
  Widget build(BuildContext context) {
    super.registerRoutes();
    return MaterialApp(
      title: 'MindForest',
      theme: CustomTheme.data,
      navigatorKey: navigatorKey,
      onGenerateRoute: super.generateRoute,
      initialRoute: FirebaseAuth.instance.currentUser == null 
        ? Routes.login
        : Routes.groups
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