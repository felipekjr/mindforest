import 'package:common_deps/common_deps.dart';
import 'package:common_quiz/common_quiz.dart';

class GroupEntity extends Equatable {
  final String name;
  final String? id;
  final DateTime creationDate;
  final List<QuizEntity> participants;
  final bool isActive;
  final String userId;
  final String accessToken;

  const GroupEntity({
    required this.name,
    required this.creationDate,
    required this.isActive,
    required this.userId,
    required this.accessToken,
    this.participants = const [],
    this.id,
  });

  factory GroupEntity.empty() => GroupEntity(
    name: '', 
    creationDate: DateTime.now(), 
    isActive: true, 
    userId: '',
    accessToken: ''
  );

  GroupEntity copy({
    String? id,
    String? name,
    List<QuizEntity>? participants,
    DateTime? creationDate,
    bool? isActive,
    num? totalScore,
    String? userId,
    String? accessToken,
  }) => GroupEntity(
    name: name ?? this.name, 
    id: id ?? this.id, 
    creationDate: creationDate ?? this.creationDate,
    isActive: isActive ?? this.isActive,
    userId: userId ?? this.userId,
    participants: participants ?? this.participants,
    accessToken: accessToken ?? this.accessToken
  );

  factory GroupEntity.fromJson(Map json) {
    return GroupEntity(
      name: json['nome'], 
      creationDate: DateTime.parse(json['data_criacao']),
      isActive: json['ativo'],
      userId: json['id_usuario'],
      accessToken: json['token']
    );
  }

  Map<String, dynamic> toJson() => {
    'ativo' : isActive,
    'data_criacao': creationDate.toString(),
    'id_usuario': userId,
    'nome': name,
    'token': accessToken
  };

  List<QuizEntity> healthyParticipants() => participants.where((e) => e.value >= 70).toList();
  List<QuizEntity> sickParticipants() => participants.where((e) => e.value < 70).toList();
  double get averageScore => participants.fold<double>(0.0, (prev, curr) => prev + curr.value) / participants.length;

  @override
  List<Object?> get props => [
    name, id, participants, creationDate, isActive, userId, accessToken
  ];
} 