import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/fonts_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Widget_TextFormField extends StatelessWidget {
  final controller;
  final labelText;
  final onSaved;
  final border_color;
  final validator;
  final icon;
  final int maxLines;
  final suffixIcon ;


  const Widget_TextFormField({
    required this.controller,
    required this.labelText,
    required this.onSaved,
    required this.border_color,
    required this.validator,
    required this.icon,
    required this.maxLines,
    required this.suffixIcon


  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // // height: 8.h,
      child: TextFormField(
          controller: controller,

          maxLines: maxLines,
          decoration: new InputDecoration(

              filled: true,
              enabled: false,
              prefixIcon: icon,
              suffixIcon:suffixIcon,
              // prefixIcon: widget.icon,
              errorBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: border_color, width: 0.w),
              ),
              fillColor: ColorManager.white,
              hintText: "$labelText",

              hintStyle: getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14.sp),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: border_color, width: 0.w),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: border_color, width: 0.w),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  borderSide: BorderSide(color: Colors.white),

                  gapPadding: 0),
              hintMaxLines: maxLines),
             validator: validator,
             onSaved: onSaved,
            keyboardType: TextInputType.text,


          enabled: true,
          textAlign: TextAlign.justify,
          autofocus: false,
          style: getRegularStyle(color: ColorManager.black, fontSize: FontSize.s14.sp)),
    );
  }
}
