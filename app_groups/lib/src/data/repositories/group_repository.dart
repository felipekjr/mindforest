import 'package:app_groups/src/domain/entities/group_entity.dart';
import 'package:common_deps/common_deps.dart';

class GroupRepository {
  
  Future<List<GroupEntity>> getAll(String userId) async {
    final snapshot = await FirebaseFirestore.instance.collection('grupos')
      .where('id_usuario', isEqualTo: userId)
      .get();
    
    return snapshot.docs.map((e) {
      return GroupEntity.fromJson(e.data()).copy(id: e.id);
    }).toList();
  }
}