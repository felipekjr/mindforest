import 'dart:async';

import 'package:app_chat/app_chat.dart';
import 'package:app_groups/app_groups.dart';
import 'package:app_home/app_home.dart';
import 'package:app_login/app_login.dart';
import 'package:common_deps/common_deps.dart';
import 'package:common_ui/common_ui.dart';
import 'package:common_user/common_user.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return ErrorOverlay(details: details);
  };
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MindForest());
}

class MindForest extends StatefulWidget {
  const MindForest({Key? key}) : super(key: key);

  @override
  State<MindForest> createState() => _MindForestState();
}

class _MindForestState extends State<MindForest> with BaseApp{
  late StreamSubscription firebaseAuthChanges;

  @override
  void initState() {
    super.initState();
    registerServices();
    // firebaseAuthChanges = FirebaseAuth.instance.authStateChanges().listen((event) {
    //   if (event == null) Navigator.popUntil(context, (route) => route.settings.name == Routes.login);
    // });
  }

  @override
  void dispose() {
    firebaseAuthChanges.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = GetIt.I<UserSessionService>().currentUser;
    super.registerRoutes();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MindForest',
      theme: CustomTheme.data,
      navigatorKey: navigatorKey,
      onGenerateRoute: super.generateRoute,
      initialRoute: user == null
        ? Routes.login
        : Routes.groups
    );
  }
  
  @override
  void registerServices() {
    GetIt.I.registerSingleton<UserSessionService>(UserSessionServiceImpl());
    super.registerServices();
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps => [
    AppLoginResolver(),
    AppHomeResolver(),
    AppGroupsResolver(),
    AppChatResolver()
  ];
}