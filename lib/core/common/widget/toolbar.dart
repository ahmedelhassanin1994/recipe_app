

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/fonts_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/core/resources/responsive.dart';
import 'package:mvvm_project/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Toolbar extends StatelessWidget{
  String tittle;
  final icon;
  Toolbar(this.tittle, this.icon,);
  Widget getContentWidget(BuildContext context) {

    return Container(
      width: AppSize.s100.w,
      // width: AppSize.s100.w,
      // decoration: new BoxDecoration(
      //     color: ColorManager.select,
      //     borderRadius: new BorderRadius.only(
      //       bottomLeft: Radius.circular(AppRadius.r5.w),
      //       bottomRight: Radius.circular(AppRadius.r5.w),
      //     )),
      padding: EdgeInsets.only(
          bottom: AppPading.p2.h, ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Container(

              margin: EdgeInsets.only(
                  // left: AppMargin.m2.w,
                  // right: AppMargin.m2.w,
                  top: AppMargin.m1.h),


              child: icon
            ),


          Container(
            margin: EdgeInsets.only(
                top: AppMargin.m1.h),
            child: Text(
              '${tittle}',
              style: getSemiBoldStyle(color: ColorManager.black,fontSize: FontSize.s16.sp),
            ),
          ),
          Container(
            width: AppSize.s10.w,
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Responsive(
      desktop: getContentWidget(context),
      tablet: getContentWidget(context),
      mobile: getContentWidget(context),
    );
  }




}

