
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:mvvm_project/core/common/widget/custom_button.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/fonts_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/core/resources/router/router_path.dart';
import 'package:mvvm_project/features/features_home/presentation/home_viewmodel.dart';
import 'package:mvvm_project/generated/locale_keys.g.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EmptyData extends StatelessWidget{

  final json_path;
  final tittle;
  final body;
  final flag;
  EmptyData({this.json_path=ImageAssets.cartEmpty,this.flag=false, this.tittle="", this.body=""});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
     alignment: Alignment.topCenter,
        child:  Container(
            width: AppSize.s80.w,
            height: AppSize.s60.h,
            margin: EdgeInsets.only(
                top: AppMargin.m2.h,
                left: AppMargin.m4.w,
                right: AppMargin.m4.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(json_path,
                    fit: BoxFit.scaleDown,
                    semanticsLabel: 'A red up arrow'),

                Container(
                  margin: EdgeInsets.only(top: AppMargin.m2.h),
                  alignment: Alignment.center,
                  child: Text(
                    tittle,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: getSemiBoldStyle(color: ColorManager.black,fontSize: FontSize.s18.sp),
                  ),
                ),
                Container(
                  width: AppSize.s40.w,
                  alignment: Alignment.center,
                  child: Text(
                    body,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: getMediumStyle(color: ColorManager.grey,fontSize: FontSize.s14.sp),
                  ),
                ),

                flag?CustomButton(
                  onTab: () {
                    // final categorie= Provider
                    //     .of<HomeViewModel>(context, listen: false).categories[0];

                    Navigator.pushNamed(context, Routes.productByCategory );
                  },
                  margin: EdgeInsets.only(
                      left: AppMargin.m8.w,
                      right: AppMargin.m8.w,
                      top: AppMargin.m8.h,bottom: AppMargin.m2.h),
                  padding: EdgeInsets.only(
                      left: AppPading.p16.w,
                      right: AppPading.p16.w,
                      top: AppPading.p2.h,
                      bottom: AppPading.p2.h),

                  style: Theme.of(context).textTheme.titleMedium,
                  text: LocaleKeys.Browse_products.tr(),
                  decoration: new BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: new BorderRadius.all(
                        Radius.circular(AppRadius.r3.w),
                      )),
                ):Container(),
              ],
            ),
          ),

    );
  }

}