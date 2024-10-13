

import 'package:flutter/cupertino.dart';
import 'package:mvvm_project/core/common/widget/loading/skeleton.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommentsLoading extends StatelessWidget{

  const CommentsLoading();

  Widget Loading(){

    return Container(
      margin: EdgeInsets.only(top: AppMargin.m1.h),
      child: Row(
        children: [
          CircleSkeleton(size: AppSize.s8.w,),
          Container(
              margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
              child: Skeleton(width: AppSize.s70.w,height: AppSize.s2.h,)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      height: AppSize.s25.h,
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Loading(),
          Loading(),
          Loading(),

        ],
      ),
    );
  }



}