import 'package:common_deps/common_deps.dart';

class QuizEntity extends Equatable {
  final String? id;
  final String? groupId;
  final int value;
  final String userId;
  final DateTime creationDate;
  
  const QuizEntity({
    required this.value,
    required this.userId,
    required this.creationDate,
    this.id,
    this.groupId,
  });

  QuizEntity copy({
    String? id
  }) => QuizEntity(
    id: id ?? this.id,
    groupId: groupId,
    value: value,
    userId: userId,
    creationDate: creationDate
  );

  @override
  List<Object?> get props => [value, userId, groupId, creationDate, id];
}