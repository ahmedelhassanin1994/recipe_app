
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/fonts_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/core/resources/responsive.dart';
import 'package:mvvm_project/features/feature_auth/presentation/onbording/onbordin_viewmodel.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnBordingPage extends StatelessWidget{

 late SliderObject sliderObject;


 OnBordingPage(this.sliderObject,{Key? key}):super(key: key);

 Widget getContentWidget(BuildContext context) {

   return Container(

     child: Stack(
       children: <Widget>[
         Container(
           width: AppSize.s100.w,
           alignment: Alignment.topLeft,
           margin: EdgeInsets.only(top: AppMargin.m1.h,left: AppMargin.m2.w,right: AppMargin.m2.w),
           // child: Image.asset(sliderObject.image,width: AppSize.s90.w,height:AppSize.s30.h ,fit: BoxFit.fill,),
           child: SvgPicture.asset(ImageAssets.icon_slider,
               fit: BoxFit.none,
               semanticsLabel: 'A red up arrow'),
         ),
        Container(

          alignment: Alignment.bottomCenter,
          child: Column(
               mainAxisAlignment: MainAxisAlignment.end,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [

                 Container(

                   child: Image.asset(sliderObject.image,width: AppSize.s90.w,height:AppSize.s30.h ,fit: BoxFit.fill,),

                 ),
                 Padding(
                   padding:  EdgeInsets.only(top: AppMargin.m4.h),
                   child: Text(
                     sliderObject.tittle,
                     textAlign: TextAlign.center,
                     style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s18.sp),
                   ),
                 ),
                 Padding(
                   padding:  EdgeInsets.only(bottom: AppPading.p14.h,top: AppPading.p2.h),
                   child: Text(
                     sliderObject.subTittle,
                     textAlign: TextAlign.center,
                     style: Theme.of(context).textTheme.titleLarge,
                   ),
                 ),

               ],

           ),
        ),







       ],
     ),
   );



 }
   @override
  Widget build(BuildContext context) {
    // TODO: implement build

     return Scaffold(
         body: SafeArea(
           child: Responsive(
             desktop: Container(),
             tablet: getContentWidget(context),
             mobile: getContentWidget(context),
           ),
         )
     );
  }


}