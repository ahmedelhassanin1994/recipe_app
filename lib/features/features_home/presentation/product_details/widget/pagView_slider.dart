

import 'package:flutter/material.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/features/features_home/presentation/product_details/widget/slider_details.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PagViewSlider extends StatelessWidget{
  final modelProduct;
  final controller ;

  const PagViewSlider(this.modelProduct,this.controller);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      width: AppSize.s100.w,
        height: AppSize.s40.h,
      child:  Stack(
        children: [
        PageView.builder(
                    itemCount: modelProduct.images.length,
                     controller: controller,
                    // clipBehavior: Clip.none,
                    pageSnapping: true,
                    onPageChanged: (index){
                      controller.jumpToPage(index);
                    },
                    // allowImplicitScrolling: true,
                    // physics: ClampingScrollPhysics(),

                    itemBuilder: (context, index) {
                      return SliderProductDetails(Img:  modelProduct.images[index].src,height: AppSize.s40.h,);
                    }

              ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: SmoothPageIndicator(
                controller: controller,
                count:  modelProduct.images.length,
                axisDirection: Axis.horizontal,
                effect:  WormEffect(
                    type: WormType.normal,
                    spacing:  8.0,
                    radius:  AppRadius.r10.w,
                    dotWidth:  AppSize.s3.w,
                    dotHeight:  AppSize.s3.w,
                    paintStyle:  PaintingStyle.stroke,
                    strokeWidth:  AppSize.s_4,
                    dotColor:  ColorManager.grey,
                    activeDotColor:  ColorManager.primary

                ),
              ),
              height: AppSize.s6.h,
              margin: EdgeInsets.only(bottom: AppMargin.m2.h),
            ),
          ),
        ],
      ),
    );
  }


}