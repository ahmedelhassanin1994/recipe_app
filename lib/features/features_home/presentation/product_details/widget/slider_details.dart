

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SliderProductDetails extends StatelessWidget{

  String Img;
  final height;


  SliderProductDetails({required this.Img, this.height});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: height,
      width: AppSize.s100.w,
      child:CachedNetworkImage(
          imageBuilder: (context, imageProvider) => Container(
              height: height,
              width: AppSize.s100.w,
              decoration: BoxDecoration(
                image: DecorationImage(image: imageProvider,fit: BoxFit.fill,),
              )),
          repeat:ImageRepeat.noRepeat,
          key: UniqueKey(),
          imageUrl:
          "${Img}",
          fit: BoxFit.fill,
          useOldImageOnUrlChange: false,
          filterQuality: FilterQuality.high,
          // alignment: Alignment.,
          width: AppSize.s100.w,
          height: height,
          placeholder: (context, url) =>Container(

              child:Image.asset(ImageAssets.placeholde,
                fit: BoxFit.fill,)),
          errorWidget: (context, url, error) => Image.asset(
            ImageAssets.placeholde,
            fit: BoxFit.fill,
          ),
          colorBlendMode: BlendMode.overlay),
    );
  }



}