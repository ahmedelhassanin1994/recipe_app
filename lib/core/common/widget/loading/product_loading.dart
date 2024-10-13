


import 'package:flutter/cupertino.dart';
import 'package:mvvm_project/core/common/widget/loading/skeleton.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductLoading extends StatelessWidget{

  final double? height, width;

 const ProductLoading({this.height, this.width});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: AppMargin.m1.h),
            child:Skeleton(width: AppSize.s35.w,height: AppSize.s16.h,),
          ),
          // Container(
          //   margin: EdgeInsets.only(top: AppMargin.m1.h),
          //   child:Skeleton(width: AppSize.s45.w,height: AppSize.s1.h,),
          // ),
          // Container(
          //   margin: EdgeInsets.only(top: AppMargin.m1.h),
          //   child:Skeleton(width: AppSize.s35.w,height: AppSize.s1.h,),
          // ),
          //
          // Container(
          //   margin: EdgeInsets.only(top: AppMargin.m1.h),
          //   child:Skeleton(width: AppSize.s25.w,height: AppSize.s1.h,),
          // ),
        ],
      ),
    );
  }


}