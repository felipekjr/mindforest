import 'package:core/micro_app.dart';
import 'package:core/micro_core_utils.dart';
import 'package:flutter/material.dart';

class AppChatResolver implements MicroApp {
  @override
  String get name => 'chat';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
    name: (context, args) => const MaterialApp()
  };

  @override
  void registerServices() {
    // TODO: implement registerServices
  }

}