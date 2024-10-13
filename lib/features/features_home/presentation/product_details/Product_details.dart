


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvvm_project/core/common/widget/custom_button.dart';
import 'package:mvvm_project/core/di.dart';
import 'package:mvvm_project/core/common/app_settings/app_settings.dart';
import 'package:mvvm_project/core/common/widget/starRating.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/fonts_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/core/resources/responsive.dart';
import 'package:mvvm_project/core/resources/router/router_path.dart';
import 'package:mvvm_project/features/features_home/domain/entities/recipe_entities.dart';
import 'package:mvvm_project/features/features_home/presentation/product_details/widget/slider_details.dart';
import 'package:mvvm_project/features/features_wishlist/presentation/favorite_viewmodel.dart';
import 'package:mvvm_project/generated/locale_keys.g.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetailScreen extends StatefulWidget {


  late Recipe_Entities modelProduct;


  ProductDetailScreen(this.modelProduct);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreen();
}

class _ProductDetailScreen extends State<ProductDetailScreen> {
  int _quantity = 1;
  final ScrollController _scrollController = ScrollController();
  final controller = PageController(viewportFraction: 1);
  bool FloatBar=false;

  late Function(GlobalKey) runAddToCartAnimation;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();

  }



  List<Widget> _buildTitle() {

    return <Widget>[
      Container(
        margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w,top: AppMargin.m2.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Container(
               width: AppSize.s70.w,
              child: Text(
               widget.modelProduct.name.toString(),
                maxLines: 3,
                style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s16.sp),
              ),
            ),
            Consumer<FavoriteViewModel>(
                builder: (_, value, __) {
                  return   InkWell(
                    onTap: (){
                      if(value.Isfavorite){
                        context.read<FavoriteViewModel>()
                            .deleteProduct(widget.modelProduct.id);
                      }else{
                        context.read<FavoriteViewModel>()
                            .AddWithlist(widget.modelProduct);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorManager.primary.withOpacity(.1),
                        shape: BoxShape.circle,


                      ),
                      padding: EdgeInsets.all(AppPading.p2.w),
                      child: SvgPicture.asset(!value.Isfavorite ?ImageAssets.wishlist :ImageAssets.favorite,
                        width: AppSize.s5.w,height: AppSize.s5.w,
                        semanticsLabel: 'A red up arrow',color: ColorManager.primary,),
                    ),
                  );
                }),


          ],
        ),
      ),

    ];
  }


  Widget _buildDescription() {
   return Container(
     width: AppSize.s100.w,
     margin: EdgeInsets.only(top: AppMargin.m2.h,left: AppMargin.m2.w,right: AppMargin.m2.w),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Container(child:  Text(LocaleKeys.description.tr(), style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s16.sp))),
         Container(child: Text(widget.modelProduct.description, style: getMediumStyle(color: ColorManager.grey,fontSize: FontSize.s14.sp))),

       ],
     ),
   );
  }

  Widget _buildQuantity() {
    return Container(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

         StatefulBuilder(builder: (context,newSetState){
          return    Container(
            width: AppSize.s80.w,
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
            child: Material(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                        child: Image.asset(ImageAssets.minus, scale:2),
                       decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorManager.white,
                         border: Border(
                           left: BorderSide(color: ColorManager.primary),
                           right: BorderSide(color: ColorManager.primary),
                           top: BorderSide(color: ColorManager.primary),
                           bottom: BorderSide(color: ColorManager.primary),
                         )
                       ),
                      padding: EdgeInsets.all(AppPading.p2.w),
                    ),
                    onTap: () {
                      if (_quantity <= 1) return;
                      newSetState(() => _quantity -= 1);

                    },

                  ),
                  const SizedBox(width: 20),
                  Text('$_quantity',
                    style: getSemiBoldStyle(color: ColorManager.black,fontSize: FontSize.s18.sp),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    child: Container(
                        padding: EdgeInsets.all(AppPading.p2.w),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorManager.primary),
                        child: Image.asset(ImageAssets.plus, scale: 2)),
                    onTap: () {newSetState(() => _quantity += 1);
                    },

                  ),
                ],
              ),
            ),
          );


         }),
        ],
      ),
    );
  }

  Widget _buldFloatBar() {
    final currency = Provider
        .of<AppSettings>(context, listen: false)
        .currency;

    final token = Provider
        .of<AppSettings>(context, listen: false)
        .token;
    buildAddCard() => Container(
      height: AppSize.s8.h,
      width: AppSize.s50.w,
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.all(Radius.circular(AppRadius.r10.w)),
        color: widget.modelProduct.highlighted? ColorManager.primary : ColorManager.grey,
        boxShadow: [
          BoxShadow(
            offset: const Offset(4, 8),
            blurRadius: 20,
            color: widget.modelProduct.highlighted?ColorManager.primary.withOpacity(0.25) : ColorManager.grey,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius:  BorderRadius.all(Radius.circular(AppRadius.r10.w)),
           splashColor: const Color(0xFFEEEEEE),
          onTap: () {

          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageAssets.bag, scale: 2),
              const SizedBox(width: 16),
               Text(
                LocaleKeys.addToCart.tr(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppSize.s14.sp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        padding:  EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            // _buildLine(),
            const SizedBox(height: 21),
            _buildQuantity(),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }

  Widget getContentWidget() {

    context.read<FavoriteViewModel>()
        .getWishlist();
    final currency = Provider
        .of<AppSettings>(context, listen: false)
        .currency;
    final token = Provider
        .of<AppSettings>(context, listen: false)
        .token;
    context.read<FavoriteViewModel>()
        .IsProducWishlistt(widget.modelProduct.id);
    return   Scaffold(

          appBar: AppBar(
            backgroundColor: ColorManager.white,
            title: Text(
              widget.modelProduct.name,
              style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s16.sp),

            ),
            centerTitle: true,
            leading:  InkWell(
              onTap:  () {
                Navigator.pop(context);

              },
              child: Container(
                  margin: EdgeInsets.all(AppMargin.m1.h),
                  width: AppSize.s14.w,
                  height: AppSize.s14.w,

                  child: Icon(Icons.arrow_back_ios_outlined,color: ColorManager.black,)),
            ),
            actions: <Widget>[


            ],
          ),

          body:Container(
            width: AppSize.s100.w,
            height: AppSize.s100.h,
            color: ColorManager.select,
            child:
            Stack(
              children: [
                CustomScrollView(
                  controller: _scrollController,
                  slivers: [

                    SliverToBoxAdapter(
                        child: Stack(

                          children: [
                            SliderProductDetails(Img: widget.modelProduct.image,height:  AppSize.s40.h,),

                            Container(
                              decoration: new BoxDecoration(
                                  color: ColorManager.select,
                                  borderRadius: new BorderRadius.only(
                                    topRight: Radius.circular(AppRadius.r5.w),
                                    topLeft: Radius.circular(AppRadius.r5.w)
                                  )),
                              margin: EdgeInsets.only(top: AppMargin.m37.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ..._buildTitle(),
                                  Container(
                                    margin: EdgeInsets.only(top: AppMargin.m2.h,left: AppMargin.m2.w,right: AppMargin.m2.w),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            widget.modelProduct.fats,

                                            // '${modelProduct.price}',
                                            style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s18.sp),

                                          ),
                                        ),
                                        Container(

                                          child: Text(
                                            ' ${currency} ',
                                            style: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s16.sp),
                                          ),
                                        ),

                                        Container(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [

                                              Container(
                                                child: Icon(Icons.arrow_downward_rounded,color: ColorManager.red,),
                                              ),
                                              Container(
                                                child: Text(
                                                  "",
                                                  // '${modelProduct.name}',
                                                  maxLines: 2,
                                                  style: getBoldStyle(color: ColorManager.grey,fontSize: FontSize.s14.sp),

                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: AppMargin.m1.h,left: AppMargin.m2.w,right: AppMargin.m2.w),
                                    width: AppSize.s100.w,
                                    child: Row(
                                      children: [

                                        // Container(
                                        //   decoration: BoxDecoration(
                                        //     image: DecorationImage(
                                        //       image: NetworkImage(widget.modelProduct.store.url),
                                        //       fit: BoxFit.fill,
                                        //     ),
                                        //     shape: BoxShape.circle,
                                        //
                                        //   ),
                                        //   width: AppSize.s10.w,
                                        //   height: AppSize.s10.w,
                                        // ),

                                        Container(
                                          margin: EdgeInsets.only(left: AppMargin.m2.w,right: AppMargin.m2.w),
                                          child: Text(
                                            widget.modelProduct.name,
                                            style: getSemiBoldStyle(color: ColorManager.black,fontSize: FontSize.s14.sp),

                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  _buildDescription(),
                                  Container(
                                    margin: EdgeInsets.only(top: AppMargin.m2.h,left: AppMargin.m2.w,right: AppMargin.m2.w),
                                    child: Text(
                                      LocaleKeys.choose_color.tr(),
                                      style: getSemiBoldStyle(color: ColorManager.black,fontSize: FontSize.s16.sp),
                                    ),

                                  ),

                                  CustomButton(
                                    onTab: () {

                                    },
                                    margin: EdgeInsets.only(
                                      left: AppMargin.m2.w,
                                      right: AppMargin.m2.w,
                                      top: AppMargin.m2.h,),
                                    padding: EdgeInsets.only(
                                        left: AppPading.p16.w,
                                        right: AppPading.p16.w,
                                        top: AppPading.p2.h,
                                        bottom: AppPading.p2.h),

                                    style: Theme.of(context).textTheme.titleMedium,
                                    text: LocaleKeys.addToCart.tr(),
                                    decoration: new BoxDecoration(
                                        color: ColorManager.primary,
                                        borderRadius: new BorderRadius.all(
                                          Radius.circular(AppRadius.r3.w),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                  ],
                ),


                // _buldFloatBar()
              ],
            ),
          ) ,


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