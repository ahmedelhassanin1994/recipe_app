


import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mvvm_project/core/app_prefs.dart';
import 'package:mvvm_project/core/common/data/data_source/local_data_source.dart';
import 'package:mvvm_project/core/common/network/dio_factory.dart';
import 'package:mvvm_project/core/common/network/network_info.dart';
import 'package:mvvm_project/features/feature_auth/data/data_source/remote_data_source_auth.dart';
import 'package:mvvm_project/features/feature_auth/data/network/apiAuth.dart';
import 'package:mvvm_project/features/feature_auth/domain/repository/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class MockAppPreferences extends Mock implements AppPreferences {}
class MockApiAuth extends Mock implements ApiAuth {}
class MokRemoteDataSourceAuth extends Mock implements RemoteDataSourceAuth {}
class MockDio extends Mock implements Dio {}

// class MockDioAdapter extends Mock implements HttpClientAdapter {}
class MokLocalDataSource extends Mock implements LocalDataSource {}
class MokRepositoryAuth extends Mock implements Repository {}
class MokNetworkInfo extends Mock implements NetworkInfo {}

class MockInternetConnectionChecker extends Mock implements InternetConnectionChecker {
  @override
  Future<bool> get isConnected async => await Future.value(true); // Adjust the return value as needed
}
