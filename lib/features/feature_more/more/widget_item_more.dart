

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Widget_Item_More extends StatelessWidget{

  final icon;
  final String tittle;
  final onTab;
  final style;

 const Widget_Item_More({required this.icon,required this.tittle,required this.onTab, this.style});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return InkWell(
      onTap: onTab,
      child: Container(

        width: AppSize.s100.w,
        decoration: new BoxDecoration(
            color: ColorManager.white,
            borderRadius: new BorderRadius.only(
              topLeft: Radius.circular(AppRadius.r2.w),
              topRight: Radius.circular(AppRadius.r2.w),
              bottomLeft: Radius.circular(AppRadius.r2.w),
              bottomRight: Radius.circular(AppRadius.r2.w),
            )
        ),
        padding: EdgeInsets.only(left: AppPading.p2.w,right: AppPading.p2.w,top: AppPading.p1.h,bottom: AppPading.p1.h),
        margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w,top: AppMargin.m1.h,bottom: AppMargin.m1.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Row(
              children: [
                 Container(
                  child:icon,
                ),
                Container(
                  margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
                  child: Text(
                    "$tittle",
                    style: style,
                  ),
                ),
              ],
            ),

            Container(
              padding: EdgeInsets.only(left: AppPading.p4.w,right: AppPading.p4.w,top: AppPading.p2.h,bottom: AppPading.p2.h),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: ColorManager.grey,
                size: AppSize.s4.w,
              ),
            ),

          ],
        ),

      ),
    );

  }

}