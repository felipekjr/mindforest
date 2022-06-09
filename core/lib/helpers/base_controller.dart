import 'package:core/helpers/ui_state.dart';
import 'package:flutter/material.dart';

abstract class BaseController {
  late ValueNotifier<UIState> state;

  void dispose() {
    state.dispose();
  }
}