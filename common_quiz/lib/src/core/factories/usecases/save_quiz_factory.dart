import 'package:common_deps/common_deps.dart';
import '../../../data/usecases/usecases.dart';
import '../../../domain/usecases/save_quiz.dart';

SaveQuiz makeSaveQuiz() => FirebaseSaveQuiz(
  firebaseFirestore: FirebaseFirestore.instance
);