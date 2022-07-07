import 'package:core/core.dart';
import 'package:flutter/material.dart';


class HistoryController extends BaseController {
  HistoryController() : super();
  
  @override
  void init() {
    state = ValueNotifier(const UIInitialState());
  } 

  @override
  void closeNotifiers() {
    state.dispose();
  }

}