


abstract class UserSessionRepository{
  Future<void> setLogedIn();
  Future<bool> checkLogedIn();
  Future<void> removeLogedIn();
  // Future<void> cacheUserSession(UserEntity currentUser);
}