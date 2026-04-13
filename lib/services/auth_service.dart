abstract class AuthService {
  Future<void> register({required String email, required String password});

  Future<void> login({required String email, required String password});
}

class AuthFailure implements Exception {
  const AuthFailure(this.message);

  final String message;
}
