

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/core/common/app_settings/app_settings.dart';
import 'package:mvvm_project/core/common/data/model/langouage.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LangouageWidget extends StatelessWidget{

  late ModelLangouage modelLangouage;
  final onTap;
  LangouageWidget(this.modelLangouage, this.onTap);

  @override
  Widget build(BuildContext context) {
    final currentLanguage =
        Provider.of<AppSettings>(context, listen: false).Language;
    // TODO: implement build
    return InkWell(
      onTap: onTap,
      child:  Container(
        width: AppSize.s100.w,
        margin: EdgeInsets.only(left: AppMargin.m3.w,right: AppMargin.m3.w,top: AppMargin.m2.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(modelLangouage.icon.toString(),
                  fit: BoxFit.fill,
                  width: AppSize.s8.w,height: AppSize.s3.h,
                ),
                Container(
                  margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
                  child: Text(
                    "${modelLangouage.text}",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
            if(currentLanguage==modelLangouage.code)
              Container(
                child: Icon(Icons.check,color: ColorManager.primary,),
              ),
          ],
        ),
      ),
    );

  }


}