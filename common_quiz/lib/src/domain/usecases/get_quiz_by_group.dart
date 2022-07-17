
import '../entities/entities.dart';

abstract class GetQuizByGroup<T extends GetQuizByGroupParams>  {
  Future<List<QuizEntity>> call({required T params});
}

abstract class GetQuizByGroupParams {
  final String groupId;

  GetQuizByGroupParams(this.groupId);
}