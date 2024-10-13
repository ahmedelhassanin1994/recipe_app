

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/core/common/app_settings/app_settings.dart';
import 'package:mvvm_project/core/common/data/model/model_currency.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CurrencyWidget extends StatelessWidget{

  final Model_Currency model_currency;
  final onTap;
 const CurrencyWidget(this.model_currency, this.onTap);

  @override
  Widget build(BuildContext context) {
    final currentCurrency =
        Provider.of<AppSettings>(context, listen: false).currency;

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
            Container(
              margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
              child: Text(
                "${model_currency.currency}",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            if(currentCurrency==model_currency.currencyCode)
              Container(
                child: Icon(Icons.check,color: ColorManager.primary,),
              ),
          ],
        ),
      ),
    );

  }


}