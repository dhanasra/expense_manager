import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/dimension_utils.dart';
import '../utils/gap.dart';

class Carousel extends StatelessWidget {
  final PageController controller;
  final ValueChanged onPageChanged;
  const Carousel({
    Key? key,
    required this.controller,
    required this.onPageChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 3,
      controller: controller,
      onPageChanged: onPageChanged,
      itemBuilder: (_,i){
        return CarouselPage(index: i);
      },
    );
  }
}

class CarouselPage extends StatelessWidget {

  final int index;

  const CarouselPage({
    Key? key,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimensions.pagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.asset("${appAssets}welcome$index.png")),
          SizedBox(
            width: Dimensions.getScreenSize(context).width*0.7,
            child: Text("title$index", style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)).tr()),
          Gap.small,
          SizedBox(
            width: Dimensions.getScreenSize(context).width*0.9,
            child: Text("content$index", style: Theme.of(context).primaryTextTheme.bodyText2?.copyWith(fontSize: 16, fontWeight: FontWeight.w500)).tr())
        ],
      ),
    );
  }
}

