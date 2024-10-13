import 'package:flutter/material.dart';
import 'package:mvvm_project/core/common/data/model/WebViewArgment.dart';
import 'package:mvvm_project/core/common/widget/widget_webView.dart';
import 'package:mvvm_project/features/feature_bottombar/bottom_bar.dart';
import 'package:mvvm_project/features/feature_more/currency/currency_screen.dart';
import 'package:mvvm_project/features/feature_more/langouage/langouage_screen.dart';
import 'package:mvvm_project/features/feature_auth/presentation/login/login.dart';
import 'package:mvvm_project/features/feature_auth/presentation/onbording/onbording_screen.dart';
import 'package:mvvm_project/features/feature_auth/presentation/splash/splashScreen.dart';
import 'package:mvvm_project/features/feature_more/more/more.dart';
import 'package:mvvm_project/core/resources/constants/strings_manager.dart';
import 'package:mvvm_project/core/resources/router/router_path.dart';
import 'package:mvvm_project/features/features_home/domain/entities/recipe_entities.dart';
import 'package:mvvm_project/features/features_home/presentation/product_details/Product_details.dart';
import 'package:mvvm_project/features/features_wishlist/presentation/favorite_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


import '../../di.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.all_routs:
        // return PageTransition(child: SplashScreen(), type: PageTransitionType.scale);
        return _generateMaterialRoute(SplashScreen());

      case Routes.onBordingRoute:
        // return PageTransition(child: SplashScreen(), type: PageTransitionType.scale);
        return _generateMaterialRoute(OnBordingScreen());


      case Routes.login:
        AuthModule();
        // return PageTransition(child: SplashScreen(), type: PageTransitionType.scale);
        return _generateMaterialRoute(LoginScreen());


      case Routes.BottomBar_Screen:
        HomeModule();
        return _generateMaterialRoute(BottomBarApp());

      case Routes.more:
        return _generateMaterialRoute(MoreScreen());

      case Routes.language:
        return _generateMaterialRoute(Langouage_Screen());
      case Routes.webview:
        final model = settings.arguments as WebViewArgment;

        return _generateMaterialRoute(WebView_Screen(
          webViewArgment: model,
        ));
 
      // case Routes.store_map:
      //   return _generateMaterialRoute(StoreMapScreen());

      case Routes.currency:
        return _generateMaterialRoute(Currency_Screen());


      case Routes.product_details:
        final model = settings.arguments as Recipe_Entities;
        // return MaterialPageRoute(
        //     builder: (_) => ProductDetailScreen(model)
        // );

    return _generateMaterialRoute(ProductDetailScreen(model));

      case Routes.wishlist_screen:
        final model = settings.arguments as bool;
        return _generateMaterialRoute(FavoriteScreen(model));


      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.noRouteFound),
              ),
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            ));
  }
}

_generateMaterialRoute(Widget screen) {


  return PageTransition(
      child: ResponsiveSizer(builder: (context, orientation, deviceType) {
        return screen;
      }),
      type: PageTransitionType.fade);
}
