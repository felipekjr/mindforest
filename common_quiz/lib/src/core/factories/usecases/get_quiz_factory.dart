import 'package:common_deps/common_deps.dart';
import 'package:common_quiz/src/data/usecases/firebase_get_quiz.dart';
import 'package:common_quiz/src/domain/usecases/get_quiz.dart';

GetQuiz makeGetQuiz() {
  return FirebaseGetQuiz(firebaseFirestore: FirebaseFirestore.instance);
}

FirebaseGetQuizParams makeGetQuizParams(String id) {
  return FirebaseGetQuizParams(id);
}


