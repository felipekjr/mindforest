import 'package:app_chat/src/domain/entities/answer_entity.dart';
import 'package:app_chat/src/domain/entities/entities.dart';
import 'package:core/core.dart';
import 'package:flutter/foundation.dart';

class ChatController extends BaseController {
  ChatController();

  int currentQuestionIndex = 0;
  List answers = [];
  List<MessageEntity> questions = [
     MessageEntity(
      name: 'Bia',
      text:
          'Olá, Tudo bem? Eu me chamo Bia e estou aqui para te ajudar com sua análise de saúde mental. Vamos lá?',
      type: MessageType.received,
    ),
    MessageEntity(
      name: 'Bia',
      text: 'Como esteve seu interesse ou prazer em fazer coisas?',
      type: MessageType.received,
    ),
  ];
  List<MessageEntity> messages = [
    MessageEntity(name: 'Felipe', text: 'Sim')
  ];

  @override
  void init() {
    state = ValueNotifier(const UIInitialState());
  }

  void reply(int value) {
    answers.add(AnswerEntity(value: value));
    currentQuestionIndex++;
    notifyListeners();
  }

  void sendForm() {

  }

  @override
  void closeNotifiers() {
    state.dispose();
  }
}
