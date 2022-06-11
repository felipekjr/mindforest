import 'package:core/helpers/ui_state.dart';
import 'package:flutter/material.dart';

abstract class BaseController extends ChangeNotifier {
  late ValueNotifier<UIState> state;

  void dispose() {
    state.dispose();
  }
}