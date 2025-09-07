import '../../../../base/datasource/exports.dart';
import '../data/models/profile_model.dart';

part 'mock/profile_mock.dart';

abstract interface class ProfileDataSource {
  static const String getUserProfileEndpoint = "auth/users/me/";
  static const String updateUserProfileEndpoint = "auth/users/me/";

  /// Gets the current user's profile information.
  FutureRequestResult<UserProfile> getUserProfile();

  /// Updates the current user's profile information.
  FutureRequestResult<UserProfile> updateUserProfile(UserProfile profile);
}

final class ProfileDataSourceImpl extends DataSource
    implements ProfileDataSource {
  ProfileDataSourceImpl({
    required super.client,
    required super.cacheManager,
    required super.connectivityMonitor,
  });

  @override
  FutureRequestResult<UserProfile> getUserProfile() {
    //TODO: continue....
    throw UnimplementedError();
  }

  @override
  FutureRequestResult<UserProfile> updateUserProfile(UserProfile profile) {
    //TODO: continue....
    throw UnimplementedError();
  }
}
