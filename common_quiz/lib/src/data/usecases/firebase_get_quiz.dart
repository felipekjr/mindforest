import 'package:common_deps/common_deps.dart';
import 'package:common_quiz/src/domain/entities/quiz_entity.dart';
import 'package:common_quiz/src/domain/usecases/get_quiz.dart';

import '../models/models.dart';

class FirebaseGetQuiz implements GetQuiz<FirebaseGetQuizParams> {
  final FirebaseFirestore firebaseFirestore;

  FirebaseGetQuiz({required this.firebaseFirestore});

  @override
  Future<List<QuizEntity>> call({required FirebaseGetQuizParams params}) async {
     final snapshot = await FirebaseFirestore.instance.collection('questionarios')
      .where('id_usuario', isEqualTo: params.userId)
      .get();
    
    final list =  snapshot.docs.map((e) {
      return FirebaseQuizModel.fromJson(e.data()).toEntity().copy(id: e.id);
    }).toList();

    list.sort((a, b) => a.creationDate.isBefore(b.creationDate) ? 1 : 0);
    return list;
  }
}

class FirebaseGetQuizParams extends GetQuizParams {
  String? groupId;

  FirebaseGetQuizParams(String userId, {this.groupId}) : super(userId);
}