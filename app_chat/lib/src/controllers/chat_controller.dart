import 'package:app_chat/src/domain/entities/answer_entity.dart';
import 'package:app_chat/src/domain/entities/entities.dart';
import 'package:common_deps/common_deps.dart';
import 'package:common_user/common_user.dart';
import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../domain/helpers/helpers.dart';
import 'mixins/messages_mixin.dart';
import 'states/states.dart';

class ChatController extends BaseController with MessagesMixin {
  final UserSessionService userSessionService;
  
  ChatController({
    required this.userSessionService
  });

  List<AnswerEntity> answers = [];

  User? get currentUser => userSessionService.currentUser;

  final ScrollController messagesScrollController = ScrollController();

  @override
  void init() {
    state = ValueNotifier(const UIInitialState());
    initQuiz();
    Future.microtask(() async { 
      await Future.delayed(const Duration(seconds: 2));
      start();
    });
  }

  void initQuiz() {
    messages = [];
    answers = [];
    currentQuestionIndex = 0;
    messages.add(questions.first);
  }

  void start() {
    nextQuestion();
    notifyListeners();
  }


  void reply(AnswerValues value) async {
    answers.add(AnswerEntity(value: value.asInt(), userId: currentUser?.uid ?? ''));
    inserReply(value.asString(), currentUser?.displayName ?? '');
    notifyListeners();
    _scrollToEnd();

 
    if (currentQuestionIndex != 9 ) {
      nextQuestion();
      state.value = LoadingMessageState(currentQuestionIndex);
      await Future.delayed(const Duration(milliseconds: 500));
      state.value = const UIInitialState();
    } else {
      state.value = const WaitingSendQuizState();
    }

    notifyListeners();
    _scrollToEnd();
  }

  void _scrollToEnd() {
    messagesScrollController.animateTo(
      (messages.length - 1) * 100,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  void sendForm() {
    final score = answers.fold<int>(0, (prev, curr) => prev + curr.value);
    print("SCORE: $score");
  }

  @override
  void closeNotifiers() {
    state.dispose();
  }
}
