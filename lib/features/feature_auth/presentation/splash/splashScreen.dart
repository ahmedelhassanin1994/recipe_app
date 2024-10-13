import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/core/app_prefs.dart';
import 'package:mvvm_project/core/di.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/core/resources/router/router_path.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:gif_view/gif_view.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {


  Timer? _timer;
  AppPreferences _sharedPreferences=instance<AppPreferences>();


  _startDelay(){
    _timer=Timer(Duration(milliseconds: 7000), _goNext);
  }

  _goNext(){
    if (kIsWeb) {
      // running on the web!
      Navigator.pushNamed(context, Routes.BottomBar_Screen);
    } else {
      // NOT running on the web! You can check for additional platforms here.
      _sharedPreferences.isUserLoggedIn().then((isUserLoginIn){
        if(isUserLoginIn){
          // navigate to main screen
         Navigator.pushReplacementNamed(context, Routes.BottomBar_Screen);

        }else{
          _sharedPreferences.isOnBordingScreenView().then((isBordingScreenView){
            if(isBordingScreenView){
              Navigator.pushReplacementNamed(context, Routes.onBordingRoute);


            }else{
              Navigator.pushReplacementNamed(context, Routes.onBordingRoute);

            }
          });
        }
      });
    }


  }

  @override
  void initState() {

    _startDelay();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      body: Center(
        child:  SvgPicture.asset(ImageAssets.splashLogo,
            width: AppSize.s100.w,
            height: AppSize.s100.h,
            fit: BoxFit.fill,
            semanticsLabel: 'A red up arrow'),
      ),
    );

  }
}
