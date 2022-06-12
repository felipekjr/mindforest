import 'package:app_groups/src/data/repositories/repositories.dart';
import 'package:app_groups/src/presentation/controllers/controllers.dart';
import 'package:app_groups/src/presentation/pages/pages.dart';
import 'package:common_deps/common_deps.dart';
import 'package:core/micro_app.dart';
import 'package:core/micro_core_utils.dart';

class AppGroupsResolver implements MicroApp {
  @override
  String get name => 'groups';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
    name: (context, args) => const GroupsPage()
  };

  @override
  void registerServices() {
    GetIt.instance.registerSingleton<GroupsController>(
      GroupsController(repository: GroupRepository())
    );
  }

}