import 'package:common_deps/common_deps.dart';

import '../../domain/entities/quiz_entity.dart';
import '../../domain/usecases/get_quiz_by_group.dart';
import '../models/models.dart';

class FirebaseGetQuizByGroup implements GetQuizByGroup<FirebaseGetQuizByGroupParams> {
  final FirebaseFirestore firebaseFirestore;

  FirebaseGetQuizByGroup({required this.firebaseFirestore});

  @override
  Future<List<QuizEntity>> call({required FirebaseGetQuizByGroupParams params}) async {
     final snapshot = await FirebaseFirestore.instance.collection('questionarios')
      .where('id_grupo', isEqualTo: params.groupId)
      .get();
    
    final list =  snapshot.docs.map((e) {
      return FirebaseQuizModel.fromJson(e.data()).toEntity().copy(id: e.id);
    }).toList();

    list.sort((a, b) => a.creationDate.isBefore(b.creationDate) ? 1 : 0);
    return list;
  }
}

class FirebaseGetQuizByGroupParams extends GetQuizByGroupParams {
  FirebaseGetQuizByGroupParams(String groupId) : super(groupId);
}