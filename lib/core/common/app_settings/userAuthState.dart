
import 'package:mvvm_project/features/feature_auth/domain/entities/login_model.dart';

abstract class UserAuthState {}

class AuthInitialState extends UserAuthState {}

class UserISAuthState extends UserAuthState {
 late String token;
 UserISAuthState(this.token);

}


class UserISNotAuthState extends UserAuthState {

}
