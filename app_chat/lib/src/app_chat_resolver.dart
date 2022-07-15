import 'package:app_groups/app_groups.dart';
import 'package:common_deps/common_deps.dart';
import 'package:common_quiz/common_quiz.dart';
import 'package:common_user/common_user.dart';
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
    final userSessionService = GetIt.I.get<UserSessionService>();
    
    GetIt.I.registerSingleton(ChatController(
      userSessionService: userSessionService,
      saveQuiz: makeSaveQuiz(),
      groupRepository: GroupRepository()
    ));
  }

}