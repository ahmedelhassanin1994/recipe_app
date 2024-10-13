import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm_project/core/common/widget/phone.dart';
import 'package:mvvm_project/core/di.dart';
import 'package:mvvm_project/core/common/widget/flash.dart';
import 'package:mvvm_project/core/common/widget/loading/loader.dart';
import 'package:mvvm_project/core/common/widget/passwordField.dart';
import 'package:mvvm_project/core/common/widget/toolbar.dart';
import 'package:mvvm_project/features/feature_auth/presentation/login/AuthState.dart';
import 'package:mvvm_project/features/feature_auth/presentation/login/login_viewmodel.dart';
import 'package:mvvm_project/generated/l10n.dart';
import 'package:mvvm_project/generated/locale_keys.g.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/fonts_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/core/resources/responsive.dart';
import 'package:mvvm_project/core/resources/router/router_path.dart';
import 'package:mvvm_project/core/common/widget/custom_button.dart';
import 'package:mvvm_project/core/common/widget/email.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  TextEditingController textEditingController_email = new TextEditingController();
  TextEditingController textEditingController_password = new TextEditingController();
  bool hidePassword = true;
  AuthViewModel authViewModel= instance<AuthViewModel>();


  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool check=true;
  Widget loginButtonMobile() {
    return Consumer<AuthViewModel>(
        builder: (_, value, __) {
          final currentState = value.state;

          if (currentState is AuthLoadingState) {
            return  Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  left: AppMargin.m10.w,
                  right: AppMargin.m10.w,
                  top: AppMargin.m6.h,bottom: AppMargin.m2.h),
              child:  CircularProgressIndicator(color: ColorManager.primary,),width: AppSize.s8.w,height: AppSize.s8.w,);
          }else{
            return Container(
              child: CustomButton(
                onTab: () {
                  if (validateAndSave()) {
                    if(check) {
                      Provider.of<AuthViewModel>(context, listen: false).login(textEditingController_email.text,
                          textEditingController_password.text,context);
                    }else{
                      Loader.showSnackBar(
                          context, LocaleKeys.plz_agree_the_term.tr());
                    }
                  }
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
                text: LocaleKeys.logine.tr(),
                decoration: new BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: new BorderRadius.all(
                      Radius.circular(AppRadius.r3.w),
                    )),
              ),
            );
          }
        }

    );

  }
  Widget loginButtonMobileTablet() {
    return Consumer<AuthViewModel>(
        builder: (_, value, __) {
          final currentState = value.state;

          if(currentState is AuthFailureState){
            Fluttertoast.showToast(
                msg: "${currentState.message}",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.SNACKBAR,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 18.0.sp
            );

          }
          if (currentState is AuthLoadingState) {
            return  Container(
              margin: EdgeInsets.only(
                  left: AppMargin.m10.w,
                  right: AppMargin.m10.w,
                  top: AppMargin.m6.h,bottom: AppMargin.m2.h),
              child:  CircularProgressIndicator(color: ColorManager.primary,),width: AppSize.s8.w,height: AppSize.s8.w,);
          }else{
            return Container(
              child: CustomButton(
                onTab: () {
                  if (validateAndSave()) {
                    if(check) {
                      Provider.of<AuthViewModel>(context, listen: false).login(textEditingController_email.text,
                          textEditingController_password.text,context);
                    }else{
                      Loader.showSnackBar(
                          context, LocaleKeys.plz_agree_the_term.tr());
                    }
                  }
                },
                margin: EdgeInsets.only(
                    left: AppMargin.m10.w,
                    right: AppMargin.m10.w,
                    top: AppMargin.m2.h,bottom: AppMargin.m2.h),
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
            );
          }
        }

    );

  }

  Widget getContentWidget() {
    return   Scaffold(
        backgroundColor: ColorManager.white,
        body: SafeArea(
            child:  Container(
              width: AppSize.s100.w,
              height: AppSize.s100.h,
              child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // SvgPicture.asset(ImageAssets.menu,
                            //     semanticsLabel: 'A red up arrow'),

                            InkWell(
                              onTap: (){
                                Navigator.pop(context);

                              },
                              child:    Container(

                                padding: EdgeInsets.all(AppPading.p1.h),
                                child: Icon(
                                  Icons.arrow_back_ios_outlined,
                                  color: ColorManager.grey,
                                  size: AppSize.s6.w,
                                ),
                              ),
                            ),



                            Container(
                              margin: EdgeInsets.only(top: AppMargin.m1.h,left: AppMargin.m2.w,right: AppMargin.m2.w),
                              // child: Image.asset(sliderObject.image,width: AppSize.s90.w,height:AppSize.s30.h ,fit: BoxFit.fill,),
                              child: SvgPicture.asset(ImageAssets.icon_slider,
                                  fit: BoxFit.none,
                                  semanticsLabel: 'A red up arrow'),
                            ),
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(left: AppMargin.m4.w,right: AppMargin.m4.w),
                            child: Form(
                              key: globalFormKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [


                                  Container(
                                    margin: EdgeInsets.only(top: AppMargin.m3.h),
                                    child: Text(
                                      LocaleKeys.welcome.tr(),
                                      style: getBoldStyle(
                                          color: ColorManager.primary, fontSize: FontSize.s16.sp),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      LocaleKeys.logine.tr(),
                                      style: getBoldStyle(
                                          color: ColorManager.black, fontSize: FontSize.s18.sp),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: AppMargin.m4.h,
                                    ),
                                    child: Text(
                                      LocaleKeys.phone.tr(),
                                      style: getSemiBoldStyle(
                                          color: ColorManager.black, fontSize: FontSize.s14.sp),
                                    ),
                                  ),
                                  Container(
                                    child: PhoneInput(
                                      style: Theme.of(context).textTheme.headlineSmall,
                                      hintStyle:getMediumStyle(color: ColorManager.grey2,fontSize: FontSize.s15.sp),
                                      borderRadius: BorderRadius.all(Radius.circular(AppRadius.r2.w)),
                                      onChanged: (val) {

                                      },
                                      onSaved: (val) {

                                      },
                                      labelText: LocaleKeys.phone.tr(),
                                      hintText:  "0112993456",
                                      textEditingController: textEditingController_email,
                                      prefixIcon: null,
                                      errorStyle: null,
                                    ),
                                  ),
                                  Container(

                                    child: Text(
                                      LocaleKeys.Password.tr(),
                                      style: getSemiBoldStyle(
                                          color: ColorManager.black, fontSize: FontSize.s14.sp),
                                    ),
                                  ),
                                  Container(

                                    child: PasswordField(
                                      hintStyle:getMediumStyle(color: ColorManager.grey2,fontSize: FontSize.s15.sp) ,
                                      style: Theme.of(context).textTheme.headlineSmall,
                                      borderRadius: BorderRadius.all(Radius.circular(AppRadius.r2.w)),
                                      onSaved: (val) {

                                      },
                                      label: "**********",
                                      textEditingController: textEditingController_password,
                                      onPressed: (){
                                        setState(() {
                                          hidePassword = !hidePassword;
                                        });
                                      },
                                      hidePassword: hidePassword,
                                    ),
                                  ),

                                  Container(
                                    alignment: Alignment.center,
                                    width: AppSize.s100.w,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        StatefulBuilder(builder: (context,newSetState){
                                          return Container(

                                            child: Row(
                                              children: [
                                                InkWell(

                                                  child: Container(
                                                    child: Icon(
                                                      check?Icons.check_circle: Icons.circle_outlined,
                                                      color: check ? ColorManager.black : ColorManager.grey,
                                                    ),
                                                  ),
                                                  onTap: (){
                                                    newSetState(() {
                                                      check =!check;
                                                    });
                                                  },
                                                ),

                                                Container(
                                                  child: Text(
                                                    LocaleKeys.remember_login.tr(),
                                                    style: Theme.of(context).textTheme.bodyLarge,
                                                  ),
                                                ),


                                              ],
                                            ),
                                          );
                                        }),
                                        InkWell(
                                          onTap: (){
                                            Navigator.pushNamed(context, Routes.reset_password);

                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(top: AppMargin.m2.h,bottom: AppMargin.m2.h),
                                            child: Text(
                                              LocaleKeys.Reset_password.tr(),
                                              style: getBoldStyle(
                                                  color: ColorManager.primary, fontSize: FontSize.s14.sp),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Center(child: loginButtonMobile()),
                                  Container(

                                      padding: EdgeInsets.only(bottom: AppPading.p2.h),
                                      // height: AppSize.s10.h,
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            LocaleKeys.dont_have_account.tr(),
                                            textAlign: TextAlign.center,
                                            style: getMediumStyle(color: ColorManager.grey,fontSize: FontSize.s15.sp),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(context, Routes.Registration_Screen);
                                            },
                                            child: Text(
                                              LocaleKeys.Create_your_account_now.tr(),
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context).textTheme.displayMedium,
                                            ),
                                          ),

                                        ],
                                      )),


                                ],
                              ),
                            )

                        ),
                      ],
                    ),
                  )),

            )
        ));
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return

      Scaffold(
          body: Responsive(
            desktop: getContentWidget(),
            tablet: getContentWidget(),
            mobile: getContentWidget(),
          )

      );
  }
}