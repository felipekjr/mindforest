import 'package:common_deps/common_deps.dart';

class AnswerEntity extends Equatable {
  final int value;
  final int questionId;
  
  const AnswerEntity({
    required this.value,
    required this.questionId,
  });

  @override
  List<Object?> get props => [value, questionId];
}