


import 'package:flutter/material.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  // final onRatingChanged;
  final Color color;


 const StarRating({this.starCount=5,this.rating=0.0,required this.color});

  Widget buildStar(BuildContext context, int index) {
   final Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        size: AppSize.s4.w,
        color:ColorManager.grey,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon =  Icon(
        Icons.star_half,
        size: AppSize.s4.w,
        color: color ?? Theme
            .of(context)
            .primaryColor,
      );
    } else {
      icon =  Icon(
        Icons.star,
        size: AppSize.s4.w,
        color: color ?? Theme
            .of(context)
            .primaryColor,
      );
    }
    return  InkResponse(
      // onTap: onRatingChanged == null ? null : () =>
      //     onRatingChanged(index + 1.0),
      child:  icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(children: new List.generate(starCount, (index) => buildStar(context, index)));
  }

}