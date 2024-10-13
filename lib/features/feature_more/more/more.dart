import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvm_project/core/constant.dart';
import 'package:mvvm_project/core/common/app_settings/app_settings.dart';
import 'package:mvvm_project/core/common/data/model/WebViewArgment.dart';
import 'package:mvvm_project/core/resources/responsive.dart';
import 'package:mvvm_project/features/feature_more/more/widget_item_more.dart';
import 'package:mvvm_project/features/feature_more/more_viewModel.dart';
import 'package:mvvm_project/generated/locale_keys.g.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/fonts_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/core/resources/router/router_path.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends StatefulWidget {

  const MoreScreen();
  @override
  _More createState() => _More();
}

class _More extends State<MoreScreen> {

  Future<void> _launchInBrowser(Uri url) async {

    if (await canLaunchUrl(url))
      await launchUrl(url);
    else
      // can't launch url, there is some error
      throw "Could not launch $url";
  }


  @override
  void initState() {
    // TODO: implement initState
    Provider.of<AppSettings>(context, listen: false).IsAuth();



    super.initState();
  }
  showAlertDialog(BuildContext context,String token) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("${LocaleKeys.cancel.tr()}"),
      onPressed:  () {
        Navigator.pop(context);

      },
    );
    Widget continueButton = TextButton(
      child: Text("${LocaleKeys.delete_account.tr()}"),
      onPressed:  () {
        Provider.of<AppSettings>(context, listen: false).exit();
        Navigator.pop(context);

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("${LocaleKeys.ask_sure_delete_account.tr()}",style: getSemiBoldStyle(color: ColorManager.black,fontSize: FontSize.s16.sp),),
      content: Text("${LocaleKeys.accountDeleteDescription.tr()}",style: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s15.sp),),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  Widget getContentWidget() {

    final token = Provider
        .of<AppSettings>(context, listen: false)
        .token;
    return  Scaffold(
      backgroundColor: ColorManager.select,
      body: SafeArea(
        child: Container(
          width: AppSize.s100.w,
          height: AppSize.s100.h,
          color: ColorManager.select,
          child: ListView(

            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: [

              Widget_Item_More(
                onTab: () {
                  Navigator.pushNamed(context, Routes.language);

                },
                icon: SvgPicture.asset(ImageAssets.language,
                    width: AppSize.s6.w,
                    color: ColorManager.primary,
                    semanticsLabel: 'A red up arrow'),
                tittle: '${LocaleKeys.language.tr()}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Widget_Item_More(
                onTab: () {
                  Navigator.pushNamed(context, Routes.currency);

                },
                icon: Icon(Icons.currency_exchange_rounded,color: ColorManager.primary,size: AppSize.s6.w,),
                tittle: '${LocaleKeys.currency.tr()}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Widget_Item_More(
                onTab: () {
                  // Navigator.pushNamed(context, Routes.wishlist_screen,arguments: true);
                  Provider.of<MoreViewModel>(context, listen: false).setIndex(3);

                },
                icon: SvgPicture.asset(ImageAssets.favoutites,
                    color: ColorManager.primary,
                    width: AppSize.s6.w,
                    semanticsLabel: 'A red up arrow'),
                tittle: '${LocaleKeys.favorite.tr()}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Widget_Item_More(
                onTab: () {
                  WebViewArgment model=new WebViewArgment(Constant.about,LocaleKeys.About_the_app.tr());
                  Navigator.pushNamed(context, Routes.webview,arguments: model );

                },
                icon: SvgPicture.asset(ImageAssets.about_app,
                    width: AppSize.s5.w,
                    color: ColorManager.primary,
                    semanticsLabel: 'A red up arrow'),
                tittle: '${LocaleKeys.About_the_app.tr()}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Widget_Item_More(
                onTab: () {
                  WebViewArgment model=new WebViewArgment(Constant.policy,LocaleKeys.replacement_Policy.tr());
                  Navigator.pushNamed(context, Routes.webview,arguments: model );
                },
                icon: SvgPicture.asset(ImageAssets.swape,
                    width: AppSize.s5.w,
                    color: ColorManager.primary,
                    semanticsLabel: 'A red up arrow'),
                tittle: '${LocaleKeys.replacement_Policy.tr()}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Widget_Item_More(
                onTab: () async{
                  // final InAppReview inAppReview = InAppReview.instance;
                  // if (await inAppReview.isAvailable()) {
                  //   inAppReview.requestReview();
                  // }
                },
                icon: Icon(Icons.star_rate,color: ColorManager.primary,size: AppSize.s6.w,),
                tittle: '${LocaleKeys.app_review.tr()}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              Consumer<AppSettings>(
                  builder: (_, value, __) {
                    if(value.isAuthUser){

                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: AppMargin.m6.h),
                            child: Widget_Item_More(
                              onTab: () {
                                showAlertDialog(context,value.token);
                              },
                              icon: SvgPicture.asset(ImageAssets.delete,
                                  width: AppSize.s5.w,
                                  color: ColorManager.error,
                                  semanticsLabel: 'A red up arrow'),
                              tittle: '${LocaleKeys. delete_account.tr()}',
                              style:  getMediumStyle(color: ColorManager.error,fontSize: FontSize.s15.sp),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              value.exit();
                              },
                           child:  Container(
                           margin: EdgeInsets.only(left: AppMargin.m6.w,right: AppMargin.m6.w,bottom: AppMargin.m4.h),
                           padding: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w,top: AppPading.p1_3.h,bottom: AppPading.p1_3.h),
                             width: AppSize.s100.w,
                            decoration: new BoxDecoration(
                               color: ColorManager.primary,
                               borderRadius: new BorderRadius.all(
                             Radius.circular(AppRadius.r2.w),
                                )
                                   // shape: BoxShape.circle,
                                 ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                               Icon(Icons.login,color: ColorManager.white,size: AppSize.s6.w,),
                               Container(
                                margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
                                 child: Text(
                                 LocaleKeys.exit.tr(),
                                style: getSemiBoldStyle(color: ColorManager.white,fontSize: FontSize.s16.sp),
                                ),
                                ),

                                 Container()
                              ],
                              ),

                    ),
                    )
                        ],
                      );


                    }else{
                      return Container();
                    }

                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget getContentWidgetTablet() {
    return  Scaffold(
      backgroundColor: ColorManager.select,
      body: SafeArea(
        child: Container(
          width: AppSize.s100.w,
          height: AppSize.s100.h,
          color: ColorManager.select,
          child: ListView(

            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Container(
                width: AppSize.s100.w,
                decoration: new BoxDecoration(
                  color: ColorManager.select,
                ),
                padding: EdgeInsets.only(
                    bottom: AppPading.p2.h, top: AppPading.p2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Container(
                      margin: EdgeInsets.only(
                          left: AppMargin.m4.w, right: AppMargin.m4.w,top: AppMargin.m2.h),
                      child: Text(
                        '${LocaleKeys.more.tr()}',
                        style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s18.sp),
                      ),
                    ),
                  ],
                ),
              ),

              Consumer<AppSettings>(
                  builder: (_, value, __) {
                    if(value.isAuthUser){
                      return  Column(
                        children: [


                        ],
                      );
                    }else{
                      return  Widget_Item_More(
                        onTab: () {
                          Navigator.pushNamed(context, Routes.login);

                        },
                        icon: Icon(Icons.login,color: ColorManager.grey,size: AppSize.s4.w,),
                        tittle: '${LocaleKeys.logine.tr()}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      );
                    }

                  }),

              Container(
                margin: EdgeInsets.only(
                    left: AppMargin.m4.w, right: AppMargin.m4.w,top: AppMargin.m2.h,bottom: AppMargin.m2.h),
                child: Text(
                  '${LocaleKeys.general_settings.tr()}',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              Widget_Item_More(
                onTab: () {
                },
                icon: SvgPicture.asset(ImageAssets.airplay,
                    width: AppSize.s4.w,
                    color: ColorManager.grey,
                    semanticsLabel: 'A red up arrow'),
                tittle: '${LocaleKeys.social_media_accounts.tr()}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              // Widget_Item_More(
              //   onTab: () {
              //     Navigator.pushNamed(context, Routes.AddComplaintScreen);
              //   },
              //   icon: SvgPicture.asset(ImageAssets.support,
              //       color: ColorManager.grey,
              //       width: AppSize.s5.w,
              //       semanticsLabel: 'A red up arrow'),
              //   tittle: '${LocaleKeys.Submit_a_complaint_or_inquiry.tr()}',
              // ),

              Widget_Item_More(
                onTab: () {
                  Navigator.pushNamed(context, Routes.language);

                },
                icon: SvgPicture.asset(ImageAssets.language,
                    width: AppSize.s4.w,
                    color: ColorManager.grey,
                    semanticsLabel: 'A red up arrow'),
                tittle: '${LocaleKeys.language.tr()}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Widget_Item_More(
                onTab: () {
                  Navigator.pushNamed(context, Routes.currency);

                },
                icon: Icon(Icons.currency_exchange_rounded,color: ColorManager.grey,size: AppSize.s4.w,),
                tittle: '${LocaleKeys.currency.tr()}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Widget_Item_More(
                onTab: () {
                  Navigator.pushNamed(context, Routes.wishlist_screen,arguments: true);

                },
                icon: SvgPicture.asset(ImageAssets.favoutites,
                    color: ColorManager.grey,
                    width: AppSize.s4.w,
                    semanticsLabel: 'A red up arrow'),
                tittle: '${LocaleKeys.favorite.tr()}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Widget_Item_More(
                onTab: () {
                  WebViewArgment model=new WebViewArgment(Constant.baseUrl,LocaleKeys.About_the_app.tr());
                  Navigator.pushNamed(context, Routes.webview,arguments: model );

                },
                icon: SvgPicture.asset(ImageAssets.about_app,
                    width: AppSize.s4.w,
                    color: ColorManager.grey,
                    semanticsLabel: 'A red up arrow'),
                tittle: '${LocaleKeys.About_the_app.tr()}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Widget_Item_More(
                onTab: () {
                  WebViewArgment model=new WebViewArgment(Constant.baseUrl,LocaleKeys.replacement_Policy.tr());
                  Navigator.pushNamed(context, Routes.webview,arguments: model );
                },
                icon: SvgPicture.asset(ImageAssets.swape,
                    width: AppSize.s4.w,
                    color: ColorManager.grey,
                    semanticsLabel: 'A red up arrow'),
                tittle: '${LocaleKeys.replacement_Policy.tr()}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              // Widget_Item_More(
              //   onTab: () {
              //
              //
              //   },
              //   icon: SvgPicture.asset(ImageAssets.chatt,
              //       width: AppSize.s5.w,
              //       color: ColorManager.grey,
              //       semanticsLabel: 'A red up arrow'),
              //   tittle: '${LocaleKeys.common_questions.tr()}',
              // ),
              Widget_Item_More(
                onTab: () async{
                  // final InAppReview inAppReview = InAppReview.instance;
                  // if (await inAppReview.isAvailable()) {
                  //   inAppReview.requestReview();
                  // }
                },
                icon: Icon(Icons.star_rate,color: ColorManager.grey,size: AppSize.s4.w,),
                tittle: '${LocaleKeys.app_review.tr()}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            // Widget_Item_More(
            //       onTab: () {
            //         Navigator.pushNamed(context, Routes.terms_screen);
            //
            //       },
            //       icon: SvgPicture.asset(ImageAssets.swape,
            //           width: AppSize.s4.w,
            //           color: ColorManager.grey,
            //           semanticsLabel: 'A red up arrow'),
            //       tittle: '${LocaleKeys. terms_of_use.tr()}',
            //       style: Theme.of(context).textTheme.bodyLarge,
            //
            //   ),


              Consumer<AppSettings>(
                  builder: (_, value, __) {
                    if(value.isAuthUser){

                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: AppMargin.m6.h),
                            child: Widget_Item_More(
                              onTab: () {
                                showAlertDialog(context,value.token);
                              },
                              icon: SvgPicture.asset(ImageAssets.delete,
                                  width: AppSize.s5.w,
                                  color: ColorManager.error,
                                  semanticsLabel: 'A red up arrow'),
                              tittle: '${LocaleKeys. delete_account.tr()}',
                              style:  getMediumStyle(color: ColorManager.error,fontSize: FontSize.s15.sp),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              value.exit();
                            },
                            child:  Container(
                              margin: EdgeInsets.only(left: AppMargin.m6.w,right: AppMargin.m6.w,bottom: AppMargin.m4.h),
                              padding: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w,top: AppPading.p1_3.h,bottom: AppPading.p1_3.h),
                              width: AppSize.s100.w,
                              decoration: new BoxDecoration(
                                  color: ColorManager.primary,
                                  borderRadius: new BorderRadius.all(
                                    Radius.circular(AppRadius.r2.w),
                                  )
                                // shape: BoxShape.circle,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.login,color: ColorManager.white,size: AppSize.s6.w,),
                                  Container(
                                    margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
                                    child: Text(
                                      LocaleKeys.exit.tr(),
                                      style: getSemiBoldStyle(color: ColorManager.white,fontSize: FontSize.s16.sp),
                                    ),
                                  ),

                                  Container()
                                ],
                              ),

                            ),
                          )
                        ],
                      );


                    }else{
                      return Container();
                    }

                  }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Responsive(
      desktop: getContentWidget(),
      tablet: getContentWidgetTablet(),
      mobile: getContentWidget(),
    );
  }
}
