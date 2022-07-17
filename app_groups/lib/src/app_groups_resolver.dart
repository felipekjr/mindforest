import 'package:app_groups/src/data/repositories/repositories.dart';
import 'package:app_groups/src/ui/pages/pages.dart';
import 'package:common_deps/common_deps.dart';
import 'package:common_quiz/common_quiz.dart';
import 'package:core/micro_app.dart';
import 'package:core/micro_core_utils.dart';
import 'package:core/routes.dart';

import 'controllers/controllers.dart';

class AppGroupsResolver implements MicroApp {
  @override
  String get name => 'groups';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
    name: (context, args) => const GroupsPage(),
    Routes.groupRegister: (context, args) => const RegisterGroupPage(),
    Routes.groupDetails: (context, args) => const GroupDetailsPage()
  };

  @override
  void registerServices() {
    final groupRepository = GroupRepository();
    GetIt.I.registerSingleton<GroupsController>(
      GroupsController(
        repository: groupRepository,
        getQuizByGroup: makeGetQuizByGroup()
      )
    );
    GetIt.I.registerSingleton<RegisterGroupController>(
      RegisterGroupController(repository: groupRepository)
    );
    GetIt.I.registerSingleton<GroupDetailsController>(
      GroupDetailsController(repository: groupRepository)
    );
  }

}