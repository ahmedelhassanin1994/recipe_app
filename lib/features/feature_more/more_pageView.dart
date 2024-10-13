

import 'package:flutter/material.dart';
import 'package:mvvm_project/features/feature_more/more/more.dart';
import 'package:mvvm_project/features/feature_more/more_viewModel.dart';
import 'package:mvvm_project/features/features_wishlist/presentation/favorite_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MorePageView extends StatefulWidget {
  @override
  _MorePageView createState() => _MorePageView();
}
class _MorePageView extends State<MorePageView> {
 late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          Expanded(
            flex: 1,
            child:  Consumer<MoreViewModel>(
            builder: (context, value, child) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                // Example: updating state outside the build phase
                if (_pageController.hasClients && value.currentIndex != _pageController.page!.round()) {
                  _pageController.animateToPage(
                    value.currentIndex,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              });

              return PageView(
                controller: _pageController,
                onPageChanged: (index) {

                },
                children: <Widget>[
                  MoreScreen(),
                  FavoriteScreen(true),
                ],
              );
            },

          ),)
        ],
      ))


    );



  }


}