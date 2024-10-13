




import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/core/di.dart';
import 'package:mvvm_project/core/common/widget/toolbar.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/core/resources/responsive.dart';
import 'package:mvvm_project/features/feature_more/currency/currency_widget.dart';
import 'package:mvvm_project/features/feature_more/langouage/langouage_widget.dart';
import 'package:mvvm_project/features/features_home/presentation/home_viewmodel.dart';
import 'package:mvvm_project/generated/locale_keys.g.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/common/app_settings/app_settings.dart';

class Currency_Screen extends StatefulWidget {
  @override
  State<Currency_Screen> createState() => _Currency_Screen();
}

class _Currency_Screen extends State<Currency_Screen>{


  AppSettings appSettings = instance<AppSettings>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Widget getContentWidget(BuildContext buildContext) {
    return Consumer<AppSettings>
      (builder: (_, value, __) {
      return
        Container(
          child: Column(
            children: [
              Toolbar('${LocaleKeys.currency.tr()}',

                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: ColorManager.grey,
                      size: AppSize.s7.w,
                    ),
                  )),
              Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics:
                    const ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: value.currencyList.length,

                    itemBuilder: (context, index) {
                      return GestureDetector(
                          child: CurrencyWidget( value.currencyList[index],
                                  (){
                                 Provider.of<AppSettings>(context, listen: false).setAppCurrency(value.currencyList[index].currencyCode.toString(),buildContext);
                                 Provider.of<HomeViewModel>(context, listen: false).refresh(value.Language,value.currencyList[index].currencyCode.toString());
                              }
                          ));
                    }
                ),
              ),

            ],
          ),
        );

    });}
  Widget getContentWidgetTablet(BuildContext buildContext) {
    return Consumer<AppSettings>
      (builder: (_, value, __) {
      return
        Container(
          child: Column(
            children: [
              Toolbar('${LocaleKeys.currency.tr()}',Icon(
                Icons.arrow_back_ios_outlined,
                color: ColorManager.grey,
                size: AppSize.s5.w,
              ),),
              Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics:
                    const ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: value.currencyList.length,

                    itemBuilder: (context, index) {
                      return GestureDetector(
                          child: CurrencyWidget( value.currencyList[index],
                                  (){
                                Provider.of<AppSettings>(context, listen: false).setAppCurrency(value.currencyList[index].currencyCode.toString(),buildContext);
                                Provider.of<HomeViewModel>(context, listen: false).refresh(value.Language,value.currencyList[index].currencyCode.toString());
                              }
                          ));
                    }
                ),
              ),

            ],
          ),
        );

    });}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(child: Scaffold(
        body: Responsive(
          desktop: getContentWidgetTablet(context),
          tablet: getContentWidgetTablet(context),
          mobile: getContentWidget(context),
        )
    ));
  }



}