


import 'package:flutter/cupertino.dart';
import 'package:mvvm_project/core/common/widget/loading/skeleton.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductByCategoryLoading extends StatelessWidget{

  final double? height, width;

 const ProductByCategoryLoading({this.height, this.width});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      width: width,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child:Skeleton(width: AppSize.s50.w,height: AppSize.s14.h,),
          ),

          Container(
            alignment: Alignment.center,
            height: AppSize.s14.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: AppMargin.m1.h),
                  child:Skeleton(width: AppSize.s35.w,height: AppSize.s1.h,),
                ),

                Container(
                  margin: EdgeInsets.only(top: AppMargin.m1.h),
                  child:Skeleton(width: AppSize.s25.w,height: AppSize.s1.h,),
                ),

                Container(
                  margin: EdgeInsets.only(top: AppMargin.m1.h),
                  child:Skeleton(width: AppSize.s18.w,height: AppSize.s1.h,),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }


}