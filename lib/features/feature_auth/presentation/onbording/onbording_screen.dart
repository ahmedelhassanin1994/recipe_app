


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvm_project/core/app_prefs.dart';
import 'package:mvvm_project/core/common/widget/custom_button.dart';
import 'package:mvvm_project/core/di.dart';
import 'package:mvvm_project/features/feature_auth/presentation/onbording/onbordin_viewmodel.dart';
import 'package:mvvm_project/features/feature_auth/presentation/onbording/onbording_page.dart';
import 'package:mvvm_project/generated/locale_keys.g.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/core/resources/router/router_path.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnBordingScreen extends StatefulWidget {

  @override
  _OnBordingScreen createState() => _OnBordingScreen();
}

class _OnBordingScreen extends State<OnBordingScreen> {

 PageController _pageController=PageController(initialPage: 0);
late SlideViewObject slideViewObject;
 OnBordingViewModel _viewModel=new OnBordingViewModel();
 AppPreferences _sharedPreferences=instance<AppPreferences>();



 _bind(){
   _viewModel.start();
   _sharedPreferences.setOnBordingScreenView();
 }



  @override
  void initState() {
     _bind();
     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
       statusBarColor: ColorManager.primary,
     ));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _viewModel.dispose();
    super.dispose();
  }


 Widget _getProperCircle(int index,int _currentindex) {
   if(index ==_currentindex){
     return SvgPicture.asset(ImageAssets.solidCircle,color: ColorManager.green.withOpacity(.2),width: AppSize.s1.w,height: AppSize.s1.h,); // selected slider
   }else{
     return SvgPicture.asset(ImageAssets.solidCircle,color: ColorManager.grey,width: AppSize.s1.w,height: AppSize.s1.h,); // unselected slider
   }
 }


   Widget _getBottomSheetWidget( SlideViewObject slideViewObject){
    return Container(
      margin: EdgeInsets.only(left: AppMargin.m4.w,right: AppMargin.m4.w),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for(int i=0;i<slideViewObject.numOfSlides;i++)
                Padding(
                  padding: EdgeInsets.all(AppPading.p_5.w),
                  child: _getProperCircle(i,slideViewObject.currentIndex),)

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: (){
                  Navigator.pushReplacementNamed(context, Routes.login);

                },
                    child:Text(LocaleKeys.Skip.tr(),textAlign: TextAlign.end,style: Theme.of(context).textTheme.bodyLarge,)

                )),

              Align(
                alignment: Alignment.centerRight,

                child: CustomButton(
                  onTab: () {
                   _viewModel.goNext();

                  },
                  margin: EdgeInsets.only(
                      left: AppMargin.m2.w,
                      right: AppMargin.m2.w,
                      top: AppMargin.m1.h,bottom: AppMargin.m1.h),
                  padding: EdgeInsets.only(
                      left: AppPading.p4.w,
                      right: AppPading.p4.w,
                      top: AppPading.p2.h,
                      bottom: AppPading.p2.h),

                  style: Theme.of(context).textTheme.titleMedium,
                  text: LocaleKeys.next.tr(),
                  decoration: new BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: new BorderRadius.all(
                        Radius.circular(AppRadius.r3.w),
                      )),
                ),
              ),

            ],
          ),
        ],
      )
    );
 }

 Widget _getContentWidget(SlideViewObject? data){
   if(data==null){
     return Container();
   }
   else
   return Scaffold(


      // bottomSheet: Container(
      //   color: ColorManager.white,
      //   height: AppSize.s100,
      //   child: Column(
      //     children: <Widget>[
      //
      //       // add layout indicator and arrow
      //       _getBottomSheetWidget(data),
      //     ],
      //   ),
      // ),

      body:SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _pageController,
                itemCount: data.hashCode,
                onPageChanged: (index){
                  _viewModel.onPageChanged(index);
                },
                itemBuilder: (context,index){

                  return OnBordingPage(data.sliderObject);
                }

            ),
            Padding(
              padding: EdgeInsets.only(top: AppPading.p78.h),
              child:  _getBottomSheetWidget(data),
            )
          ],
        ),
      )
  );

 }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder<SlideViewObject>(
      stream: _viewModel.outPutSliderView,
      builder: (context,snapShot){

        return _getContentWidget(snapShot.data);
      },


    );

  }
}

