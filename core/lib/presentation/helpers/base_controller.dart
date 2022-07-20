import 'package:flutter/material.dart';

import 'ui_state.dart';

abstract class BaseController extends ChangeNotifier {
  late ValueNotifier<UIState> state;
  void init();
  void closeNotifiers();
}