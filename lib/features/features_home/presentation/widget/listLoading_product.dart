

import 'package:flutter/cupertino.dart';
import 'package:mvvm_project/core/common/widget/loading/product_loading.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ListLoading_Product extends StatelessWidget{
 const ListLoading_Product();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: AppSize.s100.w,
        height: AppSize.s35.h,
        child:  ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const ClampingScrollPhysics(),
          children: [

            Container(
              margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
              child:ProductLoading(width: AppSize.s60.w,height: AppSize.s50.h,),
            ),
            Container(
              margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
              child:ProductLoading(width: AppSize.s60.w,height: AppSize.s50.h,),
            ),
            Container(
              margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
              child:ProductLoading(width: AppSize.s60.w,height: AppSize.s50.h,),
            ),


          ],
        )
    );
  }

}


class GridViewLoadingProduct extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: AppSize.s100.w,

        child:  GridView.count(

            primary: true,
           shrinkWrap: true,
            crossAxisCount: 2,
            
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.2),
              physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
                child:ProductLoading(width: AppSize.s60.w,height: AppSize.s40.h,),
              ),
              Container(
                margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
                child:ProductLoading(width: AppSize.s60.w,height: AppSize.s40.h,),
              ),
              Container(
                margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
                child:ProductLoading(width: AppSize.s60.w,height: AppSize.s40.h,),
              ),
              Container(
                margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
                child:ProductLoading(width: AppSize.s60.w,height: AppSize.s40.h,),
              ),
              Container(
                margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
                child:ProductLoading(width: AppSize.s60.w,height: AppSize.s40.h,),
              ),
              Container(
                margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
                child:ProductLoading(width: AppSize.s60.w,height: AppSize.s40.h,),
              ),
              Container(
                margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
                child:ProductLoading(width: AppSize.s60.w,height: AppSize.s40.h,),
              ),
              Container(
                margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
                child:ProductLoading(width: AppSize.s60.w,height: AppSize.s40.h,),
              ),
              Container(
                margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
                child:ProductLoading(width: AppSize.s60.w,height: AppSize.s40.h,),
              ),
            ]
        ),
    );
  }

}


class GridViewLoadingTabletProduct extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: AppSize.s100.w,

      child:  GridView.count(

          primary: true,
          shrinkWrap: true,
          crossAxisCount: 3,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / .9),
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
              child:ProductLoading(width: AppSize.s60.w,height: AppSize.s50.h,),
            ),
            Container(
              margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
              child:ProductLoading(width: AppSize.s60.w,height: AppSize.s50.h,),
            ),
            Container(
              margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
              child:ProductLoading(width: AppSize.s60.w,height: AppSize.s50.h,),
            ),
            Container(
              margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
              child:ProductLoading(width: AppSize.s60.w,height: AppSize.s50.h,),
            ),
            Container(
              margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
              child:ProductLoading(width: AppSize.s60.w,height: AppSize.s50.h,),
            ),
            Container(
              margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
              child:ProductLoading(width: AppSize.s60.w,height: AppSize.s50.h,),
            ),
            Container(
              margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
              child:ProductLoading(width: AppSize.s60.w,height: AppSize.s50.h,),
            ),
            Container(
              margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
              child:ProductLoading(width: AppSize.s60.w,height: AppSize.s50.h,),
            ),
            Container(
              margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
              child:ProductLoading(width: AppSize.s60.w,height: AppSize.s50.h,),
            ),
          ]
      ),
    );
  }

}