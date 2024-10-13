

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mvvm_project/core/app_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../mocks.dart';


// void main(){
//   group('app_ref', () {
//
//     late AppPreferences appPreferences;
//
//     setUp(() {
//       appPreferences=MockAppPreferences();
//       // when(() => appPreferences.setAppLanguage(any()))
//       //     .thenAnswer((invocation) => Future.value());
//
//     });
//
//     group('when calling setAppLanguage()', () {
//       group('given langouage is system', () {
//         test("should save the 'system' value of langouage", () async {
//           await appPreferences.setAppLanguage("en");
//           final captured =
//               verify(() => appPreferences.setAppLanguage(captureAny())).captured;
//           expect(captured[0], "en");
//         });
//
//         test("when calling getAppLanguage()", () async {
//
//           when(() => appPreferences.getAppLanguage())
//               .thenAnswer((_) => Future.value("en"));
//           final result = await appPreferences.getAppLanguage();
//           expect(result, "en");
//
//         });
//
//
//       });
//
//     });
//   });
//
// }