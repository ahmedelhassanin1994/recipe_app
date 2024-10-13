


import 'package:flutter/material.dart';
import 'package:mvvm_project/core/common/widget/loading/productByCategory_loading.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../resources/constants/value_manager.dart';

class ListLoadingProduct extends StatelessWidget{

  const ListLoadingProduct();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container(
        width: AppSize.s100.w,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          children: [

            Container(
              margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
              child:ProductByCategoryLoading(width: AppSize.s50.w,height: AppSize.s18.h,),
            ),
            Container(

              margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
              child:ProductByCategoryLoading(width: AppSize.s50.w,height: AppSize.s18.h,),
            ),
            Container(
              margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
              child:ProductByCategoryLoading(width: AppSize.s50.w,height: AppSize.s18.h,),
            ),

            Container(
              margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
              child:ProductByCategoryLoading(width: AppSize.s50.w,height: AppSize.s18.h,),
            ),
            Container(
              margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
              child:ProductByCategoryLoading(width: AppSize.s50.w,height: AppSize.s18.h,),
            ),
          ],
        )
    );
  }



}