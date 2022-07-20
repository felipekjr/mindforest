abstract class CacheStorage {
  Future<void> delete(String key);
  Future<dynamic> get(String key);
  Future<void> save({required String key, required String value});
}