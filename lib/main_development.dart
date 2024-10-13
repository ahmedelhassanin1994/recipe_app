// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:mvvm_project/core/constant.dart';
// import 'package:mvvm_project/core/my_app.dart';
// import 'package:mvvm_project/core/common/data/model/model_cache.dart';
// import 'package:mvvm_project/core/common/domain/entities/product_entitie.dart';
// import 'package:mvvm_project/core/resources/constants/color_manager.dart';
// import 'package:mvvm_project/features/feature_cart/domain/entities/cart_entities.dart';
// import 'package:mvvm_project/generated/codegen_loader.g.dart';
// import 'package:hive_flutter/hive_flutter.dart';
//
// import 'core/di.dart';
// import 'core/common/services/services.dart';
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await EasyLocalization.ensureInitialized();
//   await initAppModule();
//   if (kIsWeb) {
//
//   }else{
//      await Services().init();
//
//   }
//   await Hive.initFlutter();
//
//   //payment
//   //  Stripe.publishableKey=Constant.stripe_publishableKey;
//   //  Stripe.merchantIdentifier =Constant.merchantIdentifier;
//     // await Stripe.instance.applySettings();
//
//   Hive.registerAdapter<Model_Cache>(ModelCacheAdapter());
//   // await Hive.openBox<Model_Cache>('${Constant.localKey}');
//
//   // product
//   Hive.registerAdapter<Product_Entitie>(ProductEntitieAdapter());
//   Hive.registerAdapter<Images_Entitie>(ImagesEntitieAdapter());
//   Hive.registerAdapter<Store_Entitie>(StoreEntitieAdapter());
//   Hive.registerAdapter<Color_Entitie>(ColorEntitieAdapter());
//   // await Hive.openBox<Product_Entitie>('${Constant.localKey_wishlist}');
//
//   //cart
//   Hive.registerAdapter<CartEntities>(CartEntitiesAdapter());
//   // await Hive.openBox<CartEntities>('${Constant.localKey_cart}');
//
//
//   await Future.wait([ Hive.openBox<Model_Cache>('${Constant.localKey}'), Hive.openBox<Product_Entitie>('${Constant.localKey_wishlist}'),Hive.openBox<CartEntities>('${Constant.localKey_cart}')]);
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//     systemNavigationBarColor: ColorManager.white, // navigation bar color
//     statusBarColor: ColorManager.black, // status bar color
//   ));
//   runApp(
//     EasyLocalization(
//       supportedLocales: [Locale('ar'), Locale('en')],
//       path: 'assets/translations',
//       // <-- change patch to your
//       fallbackLocale: Locale('ar'),
//       assetLoader: CodegenLoader(),
//       saveLocale: true,
//       child: MyApp()),
//   );
// }
