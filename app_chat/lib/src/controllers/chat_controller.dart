import 'package:app_chat/src/domain/entities/entities.dart';
import 'package:app_groups/app_groups.dart';
import 'package:common_deps/common_deps.dart';
import 'package:common_quiz/common_quiz.dart';
import 'package:common_ui/common_ui.dart';
import 'package:common_user/common_user.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../domain/helpers/helpers.dart';
import 'mixins/messages_mixin.dart';
import 'states/states.dart';

class ChatController extends BaseController with MessagesMixin {
  final UserSessionService userSessionService;
  final SaveQuiz saveQuiz;
  final GroupRepository groupRepository;
  ChatController({
    required this.userSessionService, 
    required this.saveQuiz,
    required this.groupRepository
  });

  List<AnswerEntity> answers = [];
  String? groupAccessToken;
  
  User? get currentUser => userSessionService.currentUser;

  final ScrollController messagesScrollController = ScrollController();

  @override
  void init() {
    state = ValueNotifier(const UIInitialState());
    
    initQuiz();
    start();
  }

  void initQuiz() {
    messages = [];
    answers = [];
    currentQuestionIndex = 0;
    messages.add(questions.first);
    notifyListeners();
  }

  void start() {
    nextQuestion();
    notifyListeners();
  }

  void replyGroupToken(String res) {
    groupAccessToken = res;
    inserReply(res, currentUser?.displayName ?? '');
    nextQuestion();
    notifyListeners();
  }

  void reply(AnswerValues value) async {
    answers.add(
        AnswerEntity(value: value.asInt(), questionId: currentQuestionIndex));
    inserReply(value.asString(), currentUser?.displayName ?? '');
    notifyListeners();
    _scrollToEnd();

    if (currentQuestionIndex != 9) {
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

  void sendForm() async {
    try {
      state.value = const UILoadingState();
      final score = answers.fold<int>(0, (prev, curr) => prev + curr.value);
      final groupId = groupAccessToken != null 
        ? (await groupRepository.getByToken(groupAccessToken!))?.id 
        : null;
      final entity = QuizEntity(
        value: score,
        userId: currentUser?.uid ?? '',
        creationDate: DateTime.now(),
        groupId: groupId
      );
      await saveQuiz(
        params: makeSaveQuizParams(entity),
      );
      state.value = UISuccessState('Questionário salvo com sucesso!');
    } catch (e) {
      state.value = const UIErrorState('Erro ao salvar questionário');
    }
  }

  bool isActionsEnabled(UIState state) {
    return state is! LoadingMessageState ||
      currentQuestionIndex >= 1;
  }

  @override
  void closeNotifiers() {
    state.dispose();
  }
}
