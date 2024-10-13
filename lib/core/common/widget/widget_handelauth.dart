import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mvvm_project/generated/locale_keys.g.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/fonts_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/core/resources/responsive.dart';
import 'package:mvvm_project/core/resources/router/router_path.dart';
import 'package:mvvm_project/core/common/widget/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class WidgetHandelAuth extends StatelessWidget {

  const WidgetHandelAuth();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(

      children: <Widget>[

        Container(
          width: AppSize.s75.w,
          margin: EdgeInsets.only(
              top: AppMargin.m6.h,
              left: AppMargin.m4.w,
              right: AppMargin.m4.w),
          child: Lottie.asset(JsonAssets.plz_login),
        ),

        Container(
          child: CustomButton(
            onTab: () {
              Navigator.pushReplacementNamed(context, Routes.login);

            },
            margin: EdgeInsets.only(
                left: AppMargin.m8.w,
                right: AppMargin.m8.w,
                top: AppMargin.m3.h),
            padding: EdgeInsets.only(
                left: AppPading.p16.w,
                right: AppPading.p16.w,
                top: AppPading.p2.h,
                bottom: AppPading.p2.h),
            style: Theme.of(context).textTheme.titleMedium,
            text: LocaleKeys.logine.tr(),
            decoration: new BoxDecoration(
                color: ColorManager.primary,
                borderRadius: new BorderRadius.all(
                  Radius.circular(AppRadius.r3.w),
                )),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(7.w, 8.w, 7.w, 5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Container(
              //
              //   margin:  EdgeInsets.only(left: 2.w, right: 2.w),
              //   child: Dash(
              //     length: displaySize(context).width * 0.3,
              //     dashThickness: 1,
              //     dashGap: 1,
              //     dashColor: HexColor(MyColors.gray),
              //   ),
              // ),
              // Container(
              //
              //   margin:  EdgeInsets.only(left: 2.w, right: 2.w),
              //
              //   child: Text(
              //    '${LocaleKeys.OR.tr()}',
              //     style: TextStyle(
              //       fontSize: 18.sp,
              //       fontWeight: FontWeight.bold
              //     ),
              //   ),
              // ),

              // Container(
              //
              //   margin:  EdgeInsets.only(left: 2.w, right: 2.w),
              //   child: Dash(
              //     length: displaySize(context).width * 0.3,
              //     dashThickness: 1,
              //     dashGap: 1,
              //     dashColor: HexColor(MyColors.gray),
              //   ),
              // ),
            ],
          ),
        ),

      ],
    );
  }
}
