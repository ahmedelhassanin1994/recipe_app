
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:toastification/toastification.dart';




   void MsgPop(BuildContext context,{String mesg="",final color=Colors.white,required TextStyle style,required Icon icon}){
     toastification.showCustom(
       context: context, // optional if you use ToastificationWrapper
       autoCloseDuration: const Duration(seconds: 5),
       alignment: Alignment.topRight,
       builder: (BuildContext context, ToastificationItem holder) {
         return Container(
           width: AppSize.s100.w,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(8),
             color: color,
           ),
           padding: const EdgeInsets.all(16),
           margin: const EdgeInsets.all(8),
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
                Text('${mesg}',
                   style: style,),
              icon

             ],
           ),
         );
       },
     );
   }