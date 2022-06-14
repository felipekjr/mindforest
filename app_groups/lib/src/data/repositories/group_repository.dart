import 'package:app_groups/src/domain/entities/group_entity.dart';
import 'package:common_deps/common_deps.dart';

class GroupRepository {
  
  Future<List<GroupEntity>> getAll(String userId) async {
    final snapshot = await FirebaseFirestore.instance.collection('grupos')
      .where('id_usuario', isEqualTo: userId)
      .get();
    
    final list =  snapshot.docs.map((e) {
      return GroupEntity.fromJson(e.data()).copy(id: e.id);
    }).toList();

    list.sort((a, b) => a.creationDate.isBefore(b.creationDate) ? 1 : 0);
    return list;
  }

  Future<GroupEntity?> get(String id) async {
    final snapshot = await FirebaseFirestore.instance.doc('grupos/$id').get();
    if (snapshot.data() != null) {
      return GroupEntity.fromJson(snapshot.data()!);
    }

    return null;
  } 

  Future<bool> delete(String id) async {
    return FirebaseFirestore.instance.collection("grupos").doc(id).delete().then(
      (doc) => true,
      onError: (e) => false
    );
  } 

  Future<GroupEntity> save(GroupEntity entity) async {
    final res = await FirebaseFirestore.instance.collection('grupos')
      .add(entity.toJson());
    return entity.copy(id: res.id);
  }
}