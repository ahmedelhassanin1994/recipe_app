import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvm_project/core/di.dart';
import 'package:mvvm_project/core/common/app_settings/app_settings.dart';
import 'package:mvvm_project/core/common/widget/searchBox.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';
import 'package:mvvm_project/core/resources/responsive.dart';
import 'package:mvvm_project/core/resources/router/router_path.dart';
import 'package:mvvm_project/features/features_home/presentation/home_viewmodel.dart';
import 'package:mvvm_project/features/features_home/presentation/widget/listLoading_product.dart';
import 'package:mvvm_project/features/features_home/presentation/widget/widget_categories.dart';
import 'package:mvvm_project/generated/locale_keys.g.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/fonts_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {

 const HomeScreen();

  @override
  _HomeScreen createState() => _HomeScreen();
}

// test

class _HomeScreen extends State<HomeScreen> {

   HomeViewModel homeViewModel= instance<HomeViewModel>();

   String _currentSearch = '';
   final ScrollController _scrollController = ScrollController();
   final ScrollController _scrollControllerMostBrands = ScrollController();



   @override
  void initState() {
    // TODO: implement initState
     _scrollController.addListener(_scrollListener);
     _scrollControllerMostBrands.addListener(_scrollListenerMostBrands);


     super.initState();
  }


   @override
   void dispose() {
     _scrollController.dispose();
     _scrollControllerMostBrands.dispose();
     super.dispose();
   }
   void _scrollListener() {
     final isLoading=  Provider.of<HomeViewModel>(context, listen: false).isLoading;
     if (_scrollController.position.pixels >=
         _scrollController.position.maxScrollExtent - 100 && !isLoading) {
       final lang= Provider.of<AppSettings>(context, listen: false).Language;
     }
   }

   void _scrollListenerMostBrands() {
     final isLoading=  Provider.of<HomeViewModel>(context, listen: false).isLoadingMostBrands;
     if (_scrollControllerMostBrands.position.pixels >=
         _scrollControllerMostBrands.position.maxScrollExtent - 100 && !isLoading) {
       final lang= Provider.of<AppSettings>(context, listen: false).Language;
     }
   }


  Widget getcategories() {

    return   Consumer<HomeViewModel>(
            builder: (_, value, __) {
              if(value.stateCategories == CategoriesLoadState.loading){
                return  Center(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        left: AppMargin.m10.w,
                        right: AppMargin.m10.w,
                        top: AppMargin.m6.h,bottom: AppMargin.m2.h),
                    child:  CircularProgressIndicator(color: ColorManager.primary,),width: AppSize.s8.w,height: AppSize.s8.w,),
                );
              } if(value.stateCategories == CategoriesLoadState.loaded  ||  value.stateCategories == CategoriesLoadState.loadMore ||  value.stateCategories == CategoriesLoadState.noMore){
                return    Container(
                  margin: EdgeInsets.only(top: AppMargin.m1.h, bottom: AppMargin.m1.h,left: AppMargin.m1.w,right: AppMargin.m1.w),
                  width: AppSize.s100.w,
                  child:     GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.8),

                      ),
                      itemCount: value.recipes.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: (){

                              Navigator.pushNamed(context, Routes.product_details,arguments: value.recipes[index] );

                            },
                              child: WidgetCategories(value.recipes[index]),
                            );

                      }),
                );






              }else{
                return Container(

                    child: GridViewLoadingProduct());
              }

            }

            );
  }



   Widget getContentWidget() {
    final lang = Provider
        .of<AppSettings>(context, listen: false)
        .Language;
    final currency = Provider
        .of<AppSettings>(context, listen: false)
        .currency;


    return  Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(

            child: Container(
              width: AppSize.s100.w,
              height: AppSize.s100.h,
              color: ColorManager.white,

              child: RefreshIndicator(
                onRefresh: ()async {
                  final lang = Provider
                      .of<AppSettings>(context, listen: false)
                      .Language;
                  final currency = Provider
                      .of<AppSettings>(context, listen: false)
                      .currency;
                  Provider.of<HomeViewModel>(context, listen: false).refresh(lang,currency);



                },
                  child:SingleChildScrollView(
                    controller: _scrollController,

                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [


                              Container(

                                child:  SvgPicture.asset(ImageAssets.icon_slider,
                                  semanticsLabel: 'A red up arrow',height: AppSize.s3.h,),
                              ),


                              InkWell(
                                  onTap: (){
                                  },
                                  child:  SvgPicture.asset(ImageAssets.notification,
                                      color: ColorManager.black,
                                      semanticsLabel: 'A red up arrow')
                              ),

                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(top: AppMargin.m2.h),

                          child: SearchBox(
                            prefixIcon:  Icon(CupertinoIcons.search,size: AppSize.s5.w,),
                            suffixIcon:  Icon(CupertinoIcons.xmark_circle_fill,size: AppSize.s5.w),
                            width: AppSize.s100.w,
                            // initText:  LocaleKeys.Find_spare_parts.tr() ,
                            backgroundColor: ColorManager.select,
                            showCancelButton: false,
                            onChanged: (val) {
                              if (val.length >= 3) {
                                _currentSearch = val;
                                Navigator.pushNamed(context, Routes.search_screen,arguments: true);

                              }
                            },

                          ),
                        ) ,

                        Container(
                          margin: EdgeInsets.only(
                            left: AppMargin.m2.w,
                            top: AppMargin.m2.h,
                            right: AppMargin.m2.w,),
                          width: AppSize.s100.w,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                // child: Text(
                                //   LocaleKeys.all.tr(),
                                //   style: getMediumStyle(color: ColorManager.grey,fontSize: AppSize.s14.sp),
                                // ),
                              ),
                            ],
                          ),
                        ),


                        getcategories()

                        // getProduct(),
                        // SizedBox(height: AppSize.s1.h,)

                      ],
                    ),
                  )
                ),
              ),
            )


 
    );
  }


   @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Responsive(
      desktop: getContentWidget(),
      tablet: getContentWidget(),
      mobile: getContentWidget(),
    );
  }
}
