


import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/generated/locale_keys.g.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EmailInput extends StatelessWidget{

    final  textEditingController;
    final onSaved;
    final onChanged;
    final labelText;
    final hintText;
    final borderRadius;
    final hintStyle;
    final style;
    final errorStyle;
    final contentPadding;
    



    const EmailInput({Key? key, required this.textEditingController,required this.onSaved,required this.onChanged,required this.labelText,required this.hintText,required this.borderRadius,required this.hintStyle,required this.style, this.errorStyle, this.contentPadding}) : super(key: key);

  bool isEmail(String em) {

    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

    Widget getContentWidget(BuildContext context) {

      return Container(

        child: TextFormField(
          controller: textEditingController,
          keyboardType: TextInputType.emailAddress,
          style: style,

          onSaved:onSaved,
          onChanged:onChanged ,

          validator: (input) => !isEmail(input!)? "${LocaleKeys.Email_valid.tr()}" : null,
          decoration: InputDecoration(
            errorStyle: errorStyle,
            contentPadding: contentPadding,
            filled: true,
            // prefixIcon: widget.icon,
            fillColor: ColorManager.white.withOpacity(.1),
            enabledBorder:  OutlineInputBorder(
              // width: 0.0 produces a thin "hairline" border
              borderSide:  BorderSide(color: ColorManager.grey2),
              borderRadius: borderRadius,

            ),
            focusedBorder: OutlineInputBorder(
              borderSide:  BorderSide(color: ColorManager.grey2),
              borderRadius: borderRadius,
            ),
            border: OutlineInputBorder(

              borderRadius: borderRadius,
            ),
            // prefixIcon: Icon( Icons.alternate_email_outlined,size: AppSize.s3.h,color: ColorManager.primary,),
            hintText: "$hintText",
            hintStyle: hintStyle,


            // labelText: '$labelText',
          ),

          // ),
        ),
      );
    }


      @override
  Widget build(BuildContext context) {
    // TODO: implement build
        return getContentWidget(context);
  }
}

