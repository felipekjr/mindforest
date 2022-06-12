import 'package:app_groups/src/domain/entities/entities.dart';
import 'package:common_deps/common_deps.dart';

class GroupEntity extends Equatable {
  final String name;
  final String? id;
  final num totalScore;
  final DateTime creationDate;
  final List<QuizEntity> participants;
  final bool isActive;
  final String userId;

  const GroupEntity({
    required this.name,
    required this.totalScore,
    required this.creationDate,
    required this.isActive,
    required this.userId,
    this.participants = const [],
    this.id,
  });

  factory GroupEntity.empty() => GroupEntity(
    name: '', 
    totalScore: 0, 
    creationDate: DateTime.now(), 
    isActive: true, 
    userId: ''
  );

  GroupEntity copy({
    String? id,
    String? name,
    List<QuizEntity>? participants,
    DateTime? creationDate,
    bool? isActive,
    num? totalScore,
    String? userId
  }) => GroupEntity(
    name: name ?? this.name, 
    id: id ?? this.id, 
    totalScore: totalScore ?? this.totalScore, 
    creationDate: creationDate ?? this.creationDate,
    isActive: isActive ?? this.isActive,
    userId: userId ?? this.userId,
    participants: participants ?? this.participants
  );

  factory GroupEntity.fromJson(Map json) {
    return GroupEntity(
      name: json['nome'], 
      totalScore: json['media_pontuacao'], 
      creationDate: DateTime.parse(json['data_criacao']),
      isActive: json['ativo'],
      userId: json['id_usuario']
    );
  }

  Map<String, dynamic> toJson() => {
    'ativo' : isActive,
    'data_criacao': creationDate.toString(),
    'id_usuario': userId,
    'media_pontuacao': totalScore,
    'nome': name
  };

  List<QuizEntity> healthyParticipants() => participants.where((e) => e.result >= 70).toList();
  List<QuizEntity> sickParticipants() => participants.where((e) => e.result < 70).toList();

  @override
  List<Object?> get props => [
    name, id, totalScore, participants, creationDate, isActive, userId
  ];
} 