

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:shimmer/shimmer.dart';
class Skeleton extends StatelessWidget {
  const Skeleton({Key? key, this.height, this.width}) : super(key: key);

  final double? height, width;


  @override
  Widget build(BuildContext context) {
    return  Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(16 / 2),
      decoration:const BoxDecoration(
          color: Colors.grey,
          borderRadius:
          const BorderRadius.all(Radius.circular(6))),
    );
  }
}

class CircleSkeleton extends StatelessWidget {
  const CircleSkeleton({Key? key, this.size = 24}) : super(key: key);

  final double? size;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: size,
      width: size,
      decoration:const BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}