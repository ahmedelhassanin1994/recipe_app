

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PasswordField extends StatelessWidget{

  final hidePassword ;
  final TextEditingController textEditingController;
  final onSaved;
  final onPressed;
  final label;
  final style;
  final borderRadius;
  final hintStyle;
  final errorStyle;
  final contentPadding;




 const PasswordField({required this.hidePassword, required this.textEditingController,required this.onSaved,required this.onPressed,required this.label, this.style, this.borderRadius, this.hintStyle, this.errorStyle, this.contentPadding});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(

      keyboardType: TextInputType.text,
      controller: textEditingController,
      onSaved: onSaved,
      style: style,
      validator: (input) =>
      input!.length < 3 ? "${LocaleKeys.Password_valid.tr()}" : null,
      obscureText: hidePassword,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintText: "$label",
        errorStyle: errorStyle,
        filled: true,
        // prefixIcon: widget.icon,
        fillColor: ColorManager.white.withOpacity(.1),
        border: OutlineInputBorder(
          borderRadius: borderRadius,
        ),
        enabledBorder:  OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide:  BorderSide(color: ColorManager.grey2),
          borderRadius: borderRadius,

        ),
        focusedBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: ColorManager.grey2),
          borderRadius: borderRadius,
        ),
        // labelText: '$label',
        hintStyle: hintStyle,
        // prefixIcon: Icon(Icons.lock,size: AppSize.s3.h,color: ColorManager.primary,),

        suffixIcon: IconButton(
          onPressed:onPressed,
          color: ColorManager.primary,
          icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility,size: AppSize.s3.h,),
        ),
      ),
    );
  }

}