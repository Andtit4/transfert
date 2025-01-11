import 'package:transfert/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    // Implémentation avec Firebase Auth ou autre service
  }

  @override
  Future<void> signInWithGoogle() async {
    // Implémentation de la connexion Google
  }

  @override
  Future<void> signInWithApple() async {
    // Implémentation de la connexion Apple
  }

  @override
  Future<void> signInWithFacebook() async {
    // Implémentation de la connexion Facebook
  }
}