
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvm_project/core/common/app_settings/app_settings.dart';
import 'package:mvvm_project/core/constant.dart';
import 'package:mvvm_project/core/common/widget/loading/skeleton.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/features/features_home/domain/entities/recipe_entities.dart';
import 'package:mvvm_project/features/features_home/domain/entities/slider_model.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/resources/constants/fonts_manager.dart';

class WidgetCategories extends StatelessWidget{

 final Recipe_Entities modelCategories;
 bool onClick=false;
 int _quantity = 1;
  WidgetCategories(this.modelCategories);

 Widget _buildQuantity() {
   return     StatefulBuilder(builder: (context,newSetState){
     return  onClick?  Container(
       decoration:  BoxDecoration(
         borderRadius: BorderRadius.all(Radius.circular(AppRadius.r2.w)),
       ),
       padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
       child: Material(
         color: Colors.transparent,
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             InkWell(
               child:Container(
                 decoration: BoxDecoration(
                   color: ColorManager.green,
                   shape: BoxShape.circle,


                 ),
                 padding: EdgeInsets.all(AppPading.p1.w),
                 child:  Image.asset(ImageAssets.minus, scale:2,color: ColorManager.white),
               ),
               onTap: () {
                 if (_quantity <= 1) return;
                 newSetState(() => _quantity -= 1);
                 // Provider
                 //     .of<CartViewModel>(context, listen: false).UpdateItem(CartEntities(_quantity,modelProduct),0,context,"");
               },

             ),

             Expanded(child:  Container(
               color: ColorManager.green.withOpacity(.2),

               child: Text('$_quantity',
                 style: getSemiBoldStyle(color: ColorManager.black,fontSize: FontSize.s18.sp),
                 textAlign: TextAlign.center,
               ),
             ),),

             InkWell(
               child: Container(
                 decoration: BoxDecoration(
                   color: ColorManager.green,
                   shape: BoxShape.circle,
                 ),
                 padding: EdgeInsets.all(AppPading.p1.w),

                 child: Image.asset(ImageAssets.plus, scale: 2,color: ColorManager.white,),
               ),
               onTap: () { newSetState(() => _quantity += 1);

               // Provider
               //     .of<CartViewModel>(context, listen: false).UpdateItem(CartEntities(_quantity,modelProduct),0,context,"");
               },
             ),
           ],
         ),
       ),
     ):
     InkWell(
       onTap: (){
         newSetState(() {
           onClick=true;

         });
         final token = Provider
             .of<AppSettings>(context, listen: false)
             .token;
         // Provider.of<CartViewModel>(context, listen: false).AddCart(CartEntities(_quantity,modelProduct),context,token);

       },
       child: Container(
           decoration: BoxDecoration(
             color: ColorManager.primary,
             shape: BoxShape.circle,


           ),
           margin: EdgeInsets.all(AppMargin.m1.h),
           padding: EdgeInsets.all(AppPading.p2.w),
           child: Icon(Icons.add,color: ColorManager.white,)
       ),
     );


   }

   );
 }

 @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final lang = Provider
        .of<AppSettings>(context, listen: false)
        .Language;
    return Container(
      margin:
      EdgeInsets.only(left: AppMargin.m1.w, right: AppMargin.m1.w,top: AppMargin.m1.h,bottom: AppMargin.m1.h),
      decoration: BoxDecoration(
        color: ColorManager.black,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        borderRadius: BorderRadius.all( Radius.circular(AppRadius.r3.w),),
        image: DecorationImage(image: CachedNetworkImageProvider( "${modelCategories.image!=null ? modelCategories.image : '' }",),
            fit: BoxFit.cover),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                  decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: new BorderRadius.all(
                        Radius.circular(AppRadius.r1.w),
                      )

                  ),
                  padding: EdgeInsets.only(left: AppMargin.m1.w,right: AppMargin.m1.w),
                  margin: EdgeInsets.only(left: AppMargin.m1.w,right: AppMargin.m1.w,top: AppMargin.m1.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.star,
                        size: AppSize.s4.w,
                        color:ColorManager.orange,
                      ),
                      Text("${modelCategories.rating}",style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s14.sp),),
                    ],
                  )

              ),
              //
              Container(
                // decoration: BoxDecoration(
                //   color: ColorManager.white,
                //   shape: BoxShape.circle,
                //
                //
                // ),
                // margin: EdgeInsets.all(AppMargin.m1.h),
                // padding: EdgeInsets.all(AppPading.p2.w),
                // child: SvgPicture.asset(ImageAssets.wishlist,
                //   semanticsLabel: 'A red up arrow',color: ColorManager.primary,),
              ),


            ],
          ),
          Container(

              child: _buildQuantity())
        ],
      ),
    );
  }

}