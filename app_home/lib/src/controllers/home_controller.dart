import 'package:common_deps/common_deps.dart';
import 'package:core/core.dart';

final homeProvider = StateNotifierProvider<HomeController, UIState>((ref) {
  return HomeController();
});

class HomeController extends StateNotifier<UIState> {
  HomeController() : super(const UIInitialState());
  

  setState(UIState newState) => state = newState; 
}