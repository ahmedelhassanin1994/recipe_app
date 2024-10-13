
import 'package:mvvm_project/features/feature_auth/domain/entities/login_model.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}


class AuthSuccessState extends AuthState {
  late LoginModelUseCase loginModelUseCase;

  AuthSuccessState(this.loginModelUseCase);
}

class AuthFailureState extends AuthState {
  late String message;

  AuthFailureState({
    required this.message,
  });
}