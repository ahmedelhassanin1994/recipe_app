import 'dart:math';

import 'package:flutter/material.dart';

import 'package:mvvm_project/core/common/widget/loading/skeleton.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:mvvm_project/core/resources/responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class OrderListLoadingItem extends StatelessWidget {
  const OrderListLoadingItem();

  @override
  Widget build(BuildContext context) {
   return Responsive(mobile: OrderListLoadingItemMobile(), tablet: OrderListLoadingItemTablet(), desktop: OrderListLoadingItemTablet());
  }
}



class OrderListLoadingItemMobile extends StatelessWidget {
  const OrderListLoadingItemMobile();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 200,
      margin: const EdgeInsets.only(
          bottom: 10.0, left: 10.0, right: 10.0, top: 5.0),
      child: Column(
        children: [
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 4,
                child: Skeleton(
                  height: 14.0,
                  width: AppSize.s35.w,
                ),
              ),

              Flexible(
                flex: 4,
                child: Skeleton(
                  height: 14.0,
                  width: AppSize.s16.w,
                ),
              ),
            ],
          )),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                color:  Colors.white ,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: const Skeleton(
                      width: 80,
                      height: 80,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Skeleton(
                          height: 25.0,
                          width: Random().nextInt(150) + 100.0,
                        ),
                        const SizedBox(height: 5),
                        Skeleton(
                          height: 14.0,
                          width: Random().nextInt(100) + 50.0,
                        ),
                        const Expanded(
                          child: SizedBox(
                            height: 1,
                          ),
                        ),

                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                color: ColorManager.grey.withOpacity(.6) ,
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class OrderListLoadingItemTablet extends StatelessWidget {
  const OrderListLoadingItemTablet();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: AppSize.s18.h,
      margin: const EdgeInsets.only(
          bottom: 10.0, left: 10.0, right: 10.0, top: 5.0),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                color:  Colors.white ,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: const Skeleton(
                      width: 130,
                      height: 130,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Skeleton(
                          height: 25.0,
                          width: Random().nextInt(700) + 100.0,
                        ),
                        const SizedBox(height: 5),
                        Skeleton(
                          height: 20.0,
                          width: Random().nextInt(100) + 120.0,
                        ),
                        const Expanded(
                          child: SizedBox(
                            height: 1,
                          ),
                        ),
                        Row(
                          children: [
                            Flexible(
                              flex: Random().nextInt(4) + 4,
                              child: const Skeleton(
                                height: 18.0,
                                width: double.infinity,
                              ),
                            ),
                            const Expanded(
                              child: SizedBox(
                                width: 1,
                              ),
                            ),
                            const Flexible(
                              flex: 4,
                              child: Skeleton(
                                height: 18.0,
                                width: double.infinity,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
                color: Colors.grey.shade300 ,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Skeleton(
                          height: 25.0,
                          width: 120.0,
                        ),
                        SizedBox(height: 10),
                        Skeleton(
                          height: 20.0,
                          width: 30.0,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Skeleton(
                          height: 25.0,
                          width: 120.0,
                        ),
                        SizedBox(height: 10),
                        Skeleton(
                          height: 20.0,
                          width: 30.0,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Skeleton(
                          height: 25.0,
                          width: 120.0,
                        ),
                        SizedBox(height: 10),
                        Skeleton(
                          height: 20.0,
                          width: 30.0,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Skeleton(
                          height: 25.0,
                          width: 120.0,
                        ),
                        SizedBox(height: 10),
                        Skeleton(
                          height: 20.0,
                          width: 30.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
