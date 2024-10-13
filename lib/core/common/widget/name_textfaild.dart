


import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
class Name extends StatelessWidget{

    final  textEditingController;
    final onSaved;
    final onChanged;
    final labelText;
    final hintText;
    final validation_Message;
    final prefixIcon;
    final borderRadius;
    final maxLines;
    final fillColor;
    final icon;
    final hintStyle;
    final style;
    final errorStyle;
    final contentPadding;
    final bool validate;




    const Name({Key? key, required this.textEditingController,required this.onSaved,required this.onChanged,required this.labelText,required this.hintText,required this.validation_Message,required this.prefixIcon,required this.borderRadius,required this.maxLines,required this.fillColor,required this.icon,required this.hintStyle,required this.style, this.errorStyle, this.contentPadding,this.validate =true}) : super(key: key);
    static final RegExp nameRegExp = RegExp(r'^[a-zA-Z || \u0621-\u064A]{2,20}$',unicode: true);


    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

      child: TextFormField(
        controller: textEditingController,
        keyboardType: TextInputType.text,
        style: style,
        onSaved:onSaved,
        onChanged:onChanged ,
        maxLines: maxLines,
        validator: (value) =>
        validate ?
        value!.isEmpty ? '$validation_Message'
            : (nameRegExp.hasMatch(value) ? null
            : '$validation_Message') : null,
        decoration: InputDecoration(
          errorStyle: errorStyle,
          contentPadding: contentPadding,
          filled: true,
          fillColor:fillColor,
          focusedBorder: OutlineInputBorder(
            borderSide:  BorderSide(color: ColorManager.grey2),
            borderRadius:  borderRadius,
          ),
          enabledBorder:  OutlineInputBorder(
            borderSide:  BorderSide(color: ColorManager.grey2),
            borderRadius:  borderRadius,
          ),
          border: OutlineInputBorder(
            borderRadius:borderRadius,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: icon,
          hintText: "$hintText",
          hintStyle: hintStyle,

          // labelText: '$labelText',
        ),

        // ),
      ),
    );
  }
}

