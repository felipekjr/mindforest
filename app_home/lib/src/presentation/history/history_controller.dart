import 'package:common_deps/common_deps.dart';
import 'package:common_quiz/common_quiz.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';


class HistoryController extends BaseController {
  final GetQuiz getQuiz;

  HistoryController({
    required this.getQuiz
  }) : super();

  late ValueNotifier<List<QuizEntity>?> quizListNotifier; 
  
  @override
  void init() {
    state = ValueNotifier(const UIInitialState());
    quizListNotifier = ValueNotifier(null);
    getAll();
  }

  void getAll() async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid ?? '';
      quizListNotifier.value = await getQuiz(params: makeGetQuizParams(userId));
    } catch (e) {
      state.value = const UIErrorState('Erro ao recuperar respostas');
    }
  }

  Color getValueColor(int value) {
    return value > 70 ? AppColors.primary : AppColors.secondary;
  }

  @override
  void closeNotifiers() {
    state.dispose();
    quizListNotifier.dispose();
  }

}