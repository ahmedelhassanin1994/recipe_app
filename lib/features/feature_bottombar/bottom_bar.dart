import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvm_project/core/di.dart';
import 'package:mvvm_project/core/common/app_settings/app_settings.dart';
import 'package:mvvm_project/features/feature_more/more_pageView.dart';
import 'package:mvvm_project/features/features_home/presentation/home_screen.dart';
import 'package:mvvm_project/features/features_home/presentation/home_viewmodel.dart';
import 'package:mvvm_project/features/features_wishlist/presentation/favorite_screen.dart';
import 'package:mvvm_project/generated/locale_keys.g.dart';
import 'package:mvvm_project/core/resources/constants/assets_manager.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/styles_manger.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/core/resources/responsive.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class BottomBarApp extends StatefulWidget {
  @override
  _BottomBar createState() => _BottomBar();
}

class _BottomBar extends State<BottomBarApp> {
  int _currentIndex = 0;
  HomeViewModel homeViewModel= instance<HomeViewModel>();
  late PageController _pageController;
  bool isOpened = false;


  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: ColorManager.primary,
    ));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }
  Widget getContentWidget() {
    bool isAuth= Provider.of<AppSettings>(context, listen: false).isAuthUser;
    var token= Provider.of<AppSettings>(context, listen: false).token;
    if(isAuth){

    }
    return  WillPopScope(

     onWillPop:_onWillPop,
     child: Scaffold(
       bottomNavigationBar:    BottomNavigationBar(
           items:  <BottomNavigationBarItem>[
             BottomNavigationBarItem(
               icon:  SvgPicture.asset(ImageAssets.home,
                   color:_currentIndex==0 ? ColorManager.primary : ColorManager.grey,
                semanticsLabel: 'A red up arrow'),
               label: '${LocaleKeys.Home_Page.tr()}',
             ),

             BottomNavigationBarItem(

               icon:   SvgPicture.asset(ImageAssets.wishlist,
                 color:_currentIndex==1 ? ColorManager.primary : ColorManager.grey,
                 semanticsLabel: 'A red up arrow'),

               label: '${LocaleKeys.favorite.tr()}',
             ),


             BottomNavigationBarItem(
               icon:  SvgPicture.asset(ImageAssets.menu,
                   color:_currentIndex==3 ? ColorManager.primary : ColorManager.grey,
                   semanticsLabel: 'A red up arrow'),
               label: '${LocaleKeys.more.tr()}',
             ),
           ],
           type: BottomNavigationBarType.fixed,
           currentIndex: _currentIndex,
           selectedItemColor: ColorManager.primary,
            unselectedItemColor:ColorManager.grey,
           backgroundColor: ColorManager.white,
           unselectedLabelStyle: getRegularStyle(color: ColorManager.grey,fontSize: AppSize.s14.sp),
           iconSize: AppSize.s6.w,
           onTap: (int index) {
             setState(() => _currentIndex = index);
             _pageController.jumpToPage(index);
                   },
           elevation: 5
       ),
        backgroundColor: ColorManager.select,
        body: SizedBox.expand(
            child: Stack(
           children: [
             PageView(
              controller: _pageController,
               physics: const NeverScrollableScrollPhysics(),


               onPageChanged: (index) {
                setState(() => _currentIndex = index);
               },
                children: <Widget>[
                  HomeScreen(),
                  FavoriteScreen(false),
                  MorePageView(),
              ],
            ),
          ],
        )),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return   Responsive(
        desktop: getContentWidget(),
        tablet: getContentWidget(),
        mobile: getContentWidget(),

    );


  }
}
