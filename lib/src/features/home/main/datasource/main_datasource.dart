import '../../../../base/datasource/exports.dart';

abstract interface class MainDataSource {
  /// Calls the Sign In API endpoints.
  Future<bool> logout();
}

final class MainDataSourceImpl extends DataSource implements MainDataSource {
  MainDataSourceImpl({
    required super.client,
    required super.cacheManager,
    required super.connectivityMonitor,
  });

  @override
  Future<bool> logout() async {
    final secureCacheManage = cacheManager as CacheManagerImpl;
    final [a, b] = await Future.wait([
      secureCacheManage.removeSecureKey('refresh_token'),
      secureCacheManage.removeSecureKey('access_token'),
    ]);
    return a && b;
  }
}
