import 'package:common_deps/common_deps.dart';

import '../../data/cache/cache.dart';

class SQLiteStorageAdapter implements CacheStorage {
  final String tableName;
  final Database database;

  SQLiteStorageAdapter({
    required this.tableName,
    required this.database
  });

  @override
  Future<void> delete(String key) async {
   await database.delete(tableName, where: 'id = ?', whereArgs: [key]);
  }

  @override
  Future<dynamic> get(String key) async {
    return await database.query(tableName,
      columns: ['id'],
      where: 'id = ?',
      whereArgs: [key]);
  }

  @override
  Future<void> save({required String key, required String value}) async {
  }
}