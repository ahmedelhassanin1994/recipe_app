

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationsScreen extends StatefulWidget{

  @override
  _NotificationsScreen createState() => _NotificationsScreen();
}

class _NotificationsScreen  extends State<NotificationsScreen> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: ColorManager.select,
      body: SafeArea(
      child: Container(
        width: AppSize.s100.w,
        height: AppSize.s100.h,
        color: ColorManager.select,
      ),
      ),
    );
  }


}