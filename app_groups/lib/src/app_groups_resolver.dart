import 'package:app_groups/src/presentation/pages/pages.dart';
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
    // TODO: implement registerServices
  }

}