




import 'package:flutter/cupertino.dart';
import 'package:mvvm_project/core/app_prefs.dart';
import 'package:mvvm_project/core/resources/router/router_path.dart';
import 'package:mvvm_project/features/feature_auth/domain/usecase/deleteAccount_usecase.dart';
import 'package:mvvm_project/features/feature_auth/domain/usecase/login_usecase.dart';
import 'package:mvvm_project/features/feature_auth/domain/usecase/restPassword_usecase.dart';
import 'package:mvvm_project/features/feature_auth/presentation/login/AuthState.dart';
enum RestPasswordState {InitialState, loading, loaded,error}
enum DeleteAccountState {InitialState, loading, loaded,error}

class AuthViewModel extends ChangeNotifier{

  late LoginUseCase loginUseCase;

  late RestPasswordUseCase restPasswordUseCase;
  late DeleteAccountUseCase deleteAccountUseCase;



  late  AppPreferences sharedPreferences;
  bool loading = false;


  //restPassword  state
  RestPasswordState _staterestPassword = RestPasswordState.InitialState;
  RestPasswordState get stateRestPassword=> _staterestPassword;


  //restPassword  state
  DeleteAccountState _deleteAccountState = DeleteAccountState.InitialState;
  DeleteAccountState get deleteAccountState=> _deleteAccountState;


  AuthViewModel(this.loginUseCase, this.sharedPreferences,this.restPasswordUseCase,this.deleteAccountUseCase);

  AuthState state = AuthInitialState();
  @override
  void start() {
    // TODO: implement start
    state=AuthInitialState();
  }
  Future<void> login(String username, String Password,BuildContext context)async {

      Navigator.pushReplacementNamed(context, Routes.BottomBar_Screen);

    }




}