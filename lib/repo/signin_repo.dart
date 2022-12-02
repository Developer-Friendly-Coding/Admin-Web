abstract class ISigninRepository {
  Future<int?> signIn(String username, String password);
  Future<int?> signUp(String username, String password, String email,
      String phoneNumber, String name);
  Future<int?> signOut();
}
