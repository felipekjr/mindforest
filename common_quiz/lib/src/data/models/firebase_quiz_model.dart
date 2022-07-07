import 'package:common_quiz/common_quiz.dart';

class FirebaseQuizModel {
  final DateTime responseDate;
  final String? groupId;
  final String userId;
  final int value;

  FirebaseQuizModel({
    required this.responseDate,
    required this.groupId,
    required this.userId,
    required this.value
  });

  factory FirebaseQuizModel.fromJson(Map json) => FirebaseQuizModel(
    responseDate: DateTime.parse(json['data_resposta']),
    groupId: json['id_group'],
    userId: json['id_usuario'],
    value: json['valor']
  );

  QuizEntity toEntity() => QuizEntity(
    creationDate: responseDate,
    groupId: groupId,
    userId: userId,
    value: value
  );
}