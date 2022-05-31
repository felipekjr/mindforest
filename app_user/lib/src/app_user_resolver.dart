
import 'package:core/micro_app.dart';
import 'package:core/micro_core_utils.dart';
import 'package:flutter/material.dart';

class MicroAppUserResolver implements MicroApp {
  @override
  String get name => 'user';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
    '/$name': (context, args) => const MaterialApp()
  };

}