import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/core/common/widget/searchBox.dart';
import 'package:mvvm_project/core/common/widget/toolbar.dart';
import 'package:mvvm_project/core/resources/responsive.dart';
import 'package:mvvm_project/core/resources/router/router_path.dart';
import 'package:mvvm_project/features/feature_more/more_viewModel.dart';
import 'package:mvvm_project/features/features_home/presentation/widget/widget_categories.dart';
import 'package:mvvm_project/features/features_wishlist/presentation/favorite_viewmodel.dart';
import 'package:mvvm_project/generated/locale_keys.g.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/fonts_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class FavoriteScreen extends StatefulWidget {
  final bool flag;


  FavoriteScreen(this.flag);

  @override
  _FavoriteScreen createState() => _FavoriteScreen();
}

class _FavoriteScreen extends State<FavoriteScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  getContentWidget(){
      return  Scaffold(
        backgroundColor: ColorManager.select,
        body: SafeArea(
          child: Container(
            width: AppSize.s100.w,
            height: AppSize.s100.h,
            color: ColorManager.select,
            child: Column(
                children: [


                  Toolbar('${LocaleKeys.favorite.tr()}',

                      InkWell(
                        onTap: (){
                          // Navigator.pop(context);
                          Provider.of<MoreViewModel>(context, listen: false).setIndex(0);

                        },
                        child:widget.flag ? Icon(
                          Icons.arrow_back_ios_outlined,
                          color: ColorManager.grey,
                          size: AppSize.s7.w,
                        ):Container()
                      )),
                  Consumer<FavoriteViewModel>(
                      builder: (_, value, __) {
                        return Expanded(child: Responsive(

                          mobile:  Container(
                            width: AppSize.s100.w,
                            child:GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: MediaQuery.of(context).size.width /
                                      (MediaQuery.of(context).size.height / 1.8),

                                ),
                                itemCount: value.wishlist.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                      onTap: (){
                                        Navigator.pushNamed(context, Routes.product_details,arguments: value.wishlist[index] );

                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(top: AppMargin.m1.h),
                                        child:WidgetCategories(value.wishlist[index]),
                                      ));

                                }),
                          ),

                          tablet: Container(),
                          desktop: Container(),
                        ));


                      })
                ]
            ),
          ),
        ));
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    context.read<FavoriteViewModel>()
        .getWishlist();

    return Responsive(mobile: getContentWidget(), tablet:getContentWidget() , desktop: getContentWidget());
  }
}
