import 'package:flutter/material.dart';

class Dimensions {
  static const pagePadding = EdgeInsets.symmetric(horizontal: 20);
  static const padding_20 = EdgeInsets.all(20);
  static const padding_20_30 = EdgeInsets.symmetric(horizontal: 20, vertical: 30);
  static const padding_20_10 = EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static const padding_10_20 = EdgeInsets.symmetric(horizontal: 10, vertical: 20);

  static Size getScreenSize(context)=>MediaQuery.of(context).size;

}