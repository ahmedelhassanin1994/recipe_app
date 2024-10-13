

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/core/di.dart';
import 'package:mvvm_project/core/common/widget/toolbar.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/core/resources/responsive.dart';
import 'package:mvvm_project/features/feature_more/langouage/langouage_widget.dart';
import 'package:mvvm_project/features/features_home/presentation/home_viewmodel.dart';
import 'package:mvvm_project/generated/locale_keys.g.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/common/app_settings/app_settings.dart';

class Langouage_Screen extends StatefulWidget {
  @override
  State<Langouage_Screen> createState() => _Langouage_Screen();
}

class _Langouage_Screen extends State<Langouage_Screen>{


  AppSettings appSettings = instance<AppSettings>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Widget getContentWidget(BuildContext buildContext) {
    return Consumer<AppSettings>(builder: (_, value, __) {
     return
       Container(
           child: Column(
             children: [
               Toolbar('${LocaleKeys.language.tr()}',

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
                     itemCount: value.langList.length,

                     itemBuilder: (context, index) {
                       return new GestureDetector(
                           child: LangouageWidget( value.langList[index],
                               (){
                                 context.setLocale(Locale("${value.langList[index].code.toString()}"));
                                 Provider.of<AppSettings>(context, listen: false).setAppLanguage(value.langList[index].code.toString());
                                 Provider.of<HomeViewModel>(context, listen: false).refresh(value.langList[index].code.toString(),value.currency);
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
    return Consumer<AppSettings>(builder: (_, value, __) {
      return
        Container(
          child: Column(
            children: [
              Toolbar('${LocaleKeys.language.tr()}',Icon(
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
                    itemCount: value.langList.length,

                    itemBuilder: (context, index) {
                      return new GestureDetector(
                          child: LangouageWidget( value.langList[index],
                                  (){
                                context.setLocale(Locale("${value.langList[index].code.toString()}"));
                                Provider.of<AppSettings>(context, listen: false).setAppLanguage(value.langList[index].code.toString());
                                Provider.of<HomeViewModel>(context, listen: false).refresh(value.langList[index].code.toString(),value.currency);
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