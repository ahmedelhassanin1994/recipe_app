import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm_project/core/constant.dart';
import 'package:mvvm_project/core/my_app.dart';
import 'package:mvvm_project/core/common/data/model/model_cache.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/features/features_home/domain/entities/recipe_entities.dart';
import 'package:mvvm_project/generated/codegen_loader.g.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/di.dart';
import 'core/common/services/services.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModule();
  if (kIsWeb) {

  }else{
     await Services().init();

  }
  await Hive.initFlutter();

  Hive.registerAdapter<Model_Cache>(ModelCacheAdapter());

  // product
  Hive.registerAdapter<Recipe_Entities>(RecipeEntitiesAdapter());


  await Future.wait([ Hive.openBox<Model_Cache>('${Constant.localKey}'), Hive.openBox<Recipe_Entities>('${Constant.localKey_wishlist}')]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: ColorManager.white, // navigation bar color
    statusBarColor: ColorManager.black, // status bar color
  ));
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('ar'), Locale('en')],
      path: 'assets/translations',
      // <-- change patch to your
      fallbackLocale: Locale('ar'),
      assetLoader: CodegenLoader(),
      saveLocale: true,
      child: MyApp()),
  );
}
