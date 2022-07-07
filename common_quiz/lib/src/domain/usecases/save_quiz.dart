
import '../entities/entities.dart';

abstract class SaveQuiz<T extends SaveQuizParams>  {
  Future<QuizEntity> call({required T params});
}

abstract class SaveQuizParams {
  final QuizEntity entity;

  SaveQuizParams(this.entity);

  Map toJson();
}