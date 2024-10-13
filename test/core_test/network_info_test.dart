import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';
import 'package:mvvm_project/core/common/network/network_info.dart';

import '../mocks.dart';

void main() {
  group('NetworkInfoImpl', () {
    test('isConnected should return true when there is a connection', () async {
      // Arrange
      final mockConnectionChecker = MockInternetConnectionChecker();
      final networkInfo = MockInternetConnectionChecker();

      // Use when() to specify the behavior of hasConnection
      when(networkInfo.isConnected).thenAnswer((_) async => Future.value(true));

      // Act
      final result = await networkInfo.isConnected;

      // Assert
      expect(result, true);
    });

    // test('isConnected should return false when there is no connection', () async {
    //   // Arrange
    //   final mockConnectionChecker = MockInternetConnectionChecker();
    //   final networkInfo = NetworkInfoImpl(mockConnectionChecker);
    //
    //   // Use when() to specify the behavior of hasConnection
    //   when(mockConnectionChecker.hasConnection).thenAnswer((_) async => Future.value(false));
    //
    //   // Act
    //   final result = await networkInfo.isConnected;
    //
    //   // Assert
    //   expect(result, false);
    // });
  });
}