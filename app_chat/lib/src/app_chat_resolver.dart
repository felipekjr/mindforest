import 'package:common_deps/common_deps.dart';
import 'package:core/micro_app.dart';
import 'package:core/micro_core_utils.dart';

import 'ui/pages/pages.dart';
import 'controllers/controllers.dart';

class AppChatResolver implements MicroApp {
  @override
  String get name => 'chat';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
    name: (context, args) => const ChatPage()
  };

  @override
  void registerServices() {
    GetIt.I.registerSingleton(ChatController());
  }

}