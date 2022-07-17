import 'package:common_deps/common_deps.dart';
import 'package:common_quiz/common_quiz.dart';
import 'package:common_quiz/src/data/usecases/firebase_get_quiz_by_group.dart';

GetQuizByGroup makeGetQuizByGroup() {
  return FirebaseGetQuizByGroup(firebaseFirestore: FirebaseFirestore.instance);
}

FirebaseGetQuizByGroupParams makeGetQuizByGroupParams(String id) {
  return FirebaseGetQuizByGroupParams(id);
}


