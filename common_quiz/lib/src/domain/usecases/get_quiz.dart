
import '../entities/entities.dart';

abstract class GetQuiz<T extends GetQuizParams>  {
  Future<List<QuizEntity>> call({required T params});
}

abstract class GetQuizParams {
  final String userId;

  GetQuizParams(this.userId);
}