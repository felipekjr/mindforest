
import 'package:core/micro_app.dart';
import 'package:core/micro_core_utils.dart';

import 'ui/pages/pages.dart';

class MicroAppLoginResolver implements MicroApp {
  @override
  String get name => 'login';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
    '/$name': (context, args) => const LoginPage()
  };

}