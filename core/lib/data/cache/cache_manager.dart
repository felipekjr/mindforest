import 'package:core/data/cache/cache.dart';
import 'package:core/data/network/network_manager.dart';

abstract class CacheManager<T> {
  final T remoteClient;
  final CacheStorage cacheStorage;
  final NetworkManager networkManager;

  CacheManager({
    required this.remoteClient,
    required this.cacheStorage,
    required this.networkManager
  });

  
}