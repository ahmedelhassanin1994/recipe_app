


import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/generated/locale_keys.g.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
class PhoneInput extends StatelessWidget{

    final  textEditingController;
    final onSaved;
    final onChanged;
    final labelText;
    final hintText;
    final hintStyle;
    final borderRadius;
    final prefixIcon;
    final errorStyle;
    final style;
    final contentPadding;


     PhoneInput({Key? key, required this.textEditingController,required this.onSaved,required this.onChanged,required this.labelText,required this.hintText,required this.hintStyle,required this.borderRadius,required this.prefixIcon,required this.errorStyle,this.style, this.contentPadding}) : super(key: key);

  bool isPhone(String em) {

    String p = r'^[0-9]+$';

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
          maxLines: 1,
          maxLength: 14,
          validator: (input) => !isPhone(input!)? "${LocaleKeys.phone.tr()}" :
              input.length<11 ? "${LocaleKeys.phone_validator_mesg.tr()}" : null,
          decoration: InputDecoration(
            filled: true,
            contentPadding: contentPadding,
            counter: Offstage(),

            // prefixIcon: widget.icon,
            fillColor: ColorManager.white.withOpacity(.1),

            errorStyle: errorStyle,
            focusedBorder: OutlineInputBorder(
              borderSide:  BorderSide(color: ColorManager.grey2),
              borderRadius: borderRadius,
            ),
            enabledBorder:  OutlineInputBorder(
              borderSide:  BorderSide(color: ColorManager.grey2),
              borderRadius:borderRadius,
            ),
            prefixIcon: prefixIcon,

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

