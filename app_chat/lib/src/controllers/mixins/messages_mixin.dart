import '../../core/consts/consts.dart';
import '../../domain/entities/entities.dart';

mixin MessagesMixin {
  int currentQuestionIndex = 0;
  List<MessageEntity> questions = Consts.questions;
  List<MessageEntity> messages = [];
  
  MessageEntity get currentQuestion {
    return questions.firstWhere((e) => e.index == currentQuestionIndex);
  }

  void inserReply(String text, String author) {
    messages.add(MessageEntity(name: author, text: text));
  }

  void nextQuestion() {
    currentQuestionIndex++;
    messages.add(currentQuestion);
  }

  void init() {
    currentQuestionIndex = 0;
    messages.add(questions[0]);
  }
}