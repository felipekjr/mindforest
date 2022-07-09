
import 'package:common_deps/common_deps.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';

class FirebaseSaveQuiz implements SaveQuiz<FirebaseSaveQuizParams> {
  final FirebaseFirestore firebaseFirestore;
  
  FirebaseSaveQuiz({
    required this.firebaseFirestore
  });

  @override
  Future<QuizEntity> call({required FirebaseSaveQuizParams params}) async {
    final res = await firebaseFirestore
      .collection('questionarios')
      .add(params.toJson());

    return params.entity.copy(id: res.id);
  }
}

class FirebaseSaveQuizParams extends SaveQuizParams {
  FirebaseSaveQuizParams(QuizEntity entity) : super(entity);

  @override
  Map<String, dynamic> toJson() => {
    'id_grupo': entity.groupId,
    'id_usuario': entity.userId,
    'valor': entity.value,
    'data_resposta': entity.creationDate.toString()
  };
}