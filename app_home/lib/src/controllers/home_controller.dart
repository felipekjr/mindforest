import 'package:core/core.dart';
import 'package:flutter/material.dart';


class HomeController extends BaseController {
  HomeController() : super();
  
  @override
  void init() {
    state = ValueNotifier(const UIInitialState());
  } 

  @override
  void closeNotifiers() {
    state.dispose();
  }

}