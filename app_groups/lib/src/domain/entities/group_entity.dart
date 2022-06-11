import 'package:app_groups/src/domain/entities/entities.dart';
import 'package:common_deps/common_deps.dart';

class GroupEntity extends Equatable {
  final String name;
  final String id;
  final double totalScore;
  final List<QuizEntity> participants;

  const GroupEntity({
    required this.name,
    required this.id,
    required this.totalScore,
    required this.participants
  });

  @override
  List<Object?> get props => [
    name, id, totalScore, participants
  ];
} 