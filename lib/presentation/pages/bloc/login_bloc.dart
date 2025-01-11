import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transfert/domain/usecases/sign_in_usecases.dart';

sealed class LoginEvent {}
class LoginWithEmailPassword extends LoginEvent {
  final String email;
  final String password;
  LoginWithEmailPassword(this.email, this.password);
}

sealed class LoginState {}
class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginFailure extends LoginState {
  final String error;
  LoginFailure(this.error);
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SignInUseCase signInUseCase;

  LoginBloc(this.signInUseCase) : super(LoginInitial()) {
    on<LoginWithEmailPassword>((event, emit) async {
      emit(LoginLoading());
      try {
        await signInUseCase.execute(event.email, event.password);
        emit(LoginSuccess());
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });
  }
}