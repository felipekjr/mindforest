import 'package:common_deps/common_deps.dart';

import '../../../data/usecases/usecases.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';

SaveQuiz makeSaveQuiz() => FirebaseSaveQuiz(
  firebaseFirestore: FirebaseFirestore.instance
);

SaveQuizParams makeSaveQuizParams(QuizEntity entity) => FirebaseSaveQuizParams(entity);