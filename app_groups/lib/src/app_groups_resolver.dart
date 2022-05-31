import 'package:core/micro_app.dart';
import 'package:core/micro_core_utils.dart';
import 'package:flutter/material.dart';

class AppGroupsResolver implements MicroApp {
  @override
  String get name => 'bills';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
    '/$name/status': (context, args) => const MaterialApp()
  };

}