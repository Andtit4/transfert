import 'package:transfert/domain/repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<void> execute(String email, String password) {
    return repository.signInWithEmailAndPassword(email, password);
  }
}