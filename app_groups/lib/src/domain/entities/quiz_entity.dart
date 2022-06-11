import 'package:common_deps/common_deps.dart';

class QuizEntity extends Equatable {
  final String userId;
  final String userAlias;
  final String? groupId;
  final double result;
  final DateTime creationDate;

  const QuizEntity({
    required this.userAlias,
    required this.userId,
    required this.result,
    required this.creationDate,
    this.groupId,
  });

  @override
  List<Object?> get props => [userId, userAlias, groupId, result, creationDate];
}