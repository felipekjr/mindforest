import 'package:app_groups/src/data/repositories/repositories.dart';
import 'package:app_groups/src/presentation/controllers/controllers.dart';
import 'package:app_groups/src/presentation/pages/pages.dart';
import 'package:common_deps/common_deps.dart';
import 'package:core/micro_app.dart';
import 'package:core/micro_core_utils.dart';
import 'package:core/routes.dart';

class AppGroupsResolver implements MicroApp {
  @override
  String get name => 'groups';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
    name: (context, args) => const GroupsPage(),
    Routes.groupRegister: (context, args) => const RegisterGroupPage()
  };

  @override
  void registerServices() {
    final groupRepository = GroupRepository();
    GetIt.I.registerSingleton<GroupsController>(
      GroupsController(repository: groupRepository)
    );
    GetIt.I.registerSingleton<RegisterGroupController>(
      RegisterGroupController(repository: groupRepository)
    );
  }

}