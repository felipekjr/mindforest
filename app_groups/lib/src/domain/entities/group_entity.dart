import 'package:app_groups/src/domain/entities/entities.dart';
import 'package:common_deps/common_deps.dart';

class GroupEntity extends Equatable {
  final String name;
  final String? id;
  final num totalScore;
  final DateTime creationDate;
  final List<QuizEntity>? participants;

  const GroupEntity({
    required this.name,
    required this.totalScore,
    required this.creationDate,
    this.id,
    this.participants,
  });

  GroupEntity copy({
    String? id
  }) => GroupEntity(
    name: name, 
    id: id ?? this.id, 
    totalScore: totalScore, 
    creationDate: creationDate
  );

  factory GroupEntity.fromJson(Map json) {
    return GroupEntity(
      name: json['nome'], 
      totalScore: json['media_pontuacao'], 
      participants: const [],
      creationDate: DateTime.parse(json['data_criacao'])
    );
  }

  List<QuizEntity> healthyParticipants() => participants?.where((e) => e.result >= 70).toList() ?? [];
  List<QuizEntity> sickParticipants() => participants?.where((e) => e.result < 70).toList() ?? [];

  @override
  List<Object?> get props => [
    name, id, totalScore, participants, creationDate
  ];
} 