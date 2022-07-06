import 'package:common_deps/common_deps.dart';

class AnswerEntity extends Equatable {
  final int value;
  final String? quizId;
  final String userId;
  
  const AnswerEntity({
    required this.value,
    required this.userId,
    this.quizId,
  });

  @override
  List<Object?> get props => [value, userId, quizId];
}