import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/core/di.dart';
import 'package:mvvm_project/core/resources/constants/theme_manager.dart';
import 'package:mvvm_project/core/resources/router/app_router.dart';
import 'package:mvvm_project/core/resources/router/router_path.dart';
import 'package:mvvm_project/features/feature_auth/presentation/login/login_viewmodel.dart';
import 'package:mvvm_project/features/feature_more/more_viewModel.dart';
import 'package:mvvm_project/features/features_home/presentation/home_viewmodel.dart';
import 'package:mvvm_project/features/features_wishlist/presentation/favorite_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'common/app_settings/app_settings.dart';

class MyApp extends StatefulWidget {
  MyApp._internal();
  static final MyApp instance = MyApp._internal();
  factory MyApp() => instance;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppSettings appSettings= instance<AppSettings>();
  HomeViewModel homeViewModel= instance<HomeViewModel>();
  AuthViewModel authViewModel= instance<AuthViewModel>();
  FavoriteViewModel favoriteViewModel= instance<FavoriteViewModel>();
  MoreViewModel moreViewModel= instance<MoreViewModel>();
  // final Smartlook smartlook = Smartlook.instance;


@override
  void initState() {
    // TODO: implement initState
  super.initState();
  // smartlook.start();
  // smartlook.preferences.setProjectKey('d7a499f611fffa93f057cadf99a84bd9f8ab6286');
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    appSettings.start();
    // homeViewModel.getSlider();


    // TODO: implement build
    return ChangeNotifierProvider<AppSettings>.value(
    value:appSettings ,
      child:
      MultiProvider(
          providers: [
            ChangeNotifierProvider<AppSettings>.value(
                value: appSettings,
            ),

            ChangeNotifierProvider<MoreViewModel>.value(
              value: moreViewModel,
            ),
            ChangeNotifierProvider<HomeViewModel>.value(
              value: homeViewModel,
            ),

            ChangeNotifierProvider<AuthViewModel>.value(
              value: authViewModel,),
            ChangeNotifierProvider<FavoriteViewModel>.value(
              value: favoriteViewModel,),

          ],

          child: ResponsiveSizer(builder: (context, orientation, deviceType) {
            return   Consumer<AppSettings>(
              builder: (_, value, __) {
                homeViewModel.getcategories();
                context.setLocale(Locale("${value.Language}"));
                return  MaterialApp(
                  onGenerateRoute: RouteGenerator.getRoute,
                  supportedLocales: context.supportedLocales,
                  localizationsDelegates: context.localizationDelegates,
                  locale: Locale("${value.Language}",value.currency),
                  debugShowCheckedModeBanner: false,
                  initialRoute: Routes.all_routs,
                  theme: getApplicationTheme(),
                );
              }
            );


          }))
    );

  }
}
