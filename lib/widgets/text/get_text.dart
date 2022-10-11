import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

enum TextType{
  mini,
  normal,
  sub
}

class GetText {

  static highlightedTitle(String text, {Color? color}){
    return Text(text,
        style: TextStyle(
            fontSize: 18,
            color: color??primary,
            fontWeight: FontWeight.w600
        )
    ).tr();
  }

  static normalText(String text, {Color? color}){
    return Text(text,
        style: TextStyle(
            fontSize: 14,
            color: color,
            fontWeight: FontWeight.w600
        )
    ).tr();
  }

  static subTitleSmall(String text, {Color? color, TextType? type, TextAlign? align, bool isBold = true}){
    return Text(text,
      textAlign: align??TextAlign.start,
      style: TextStyle(
          fontSize: type!=null
              ? type==TextType.mini ? 12
              : type==TextType.sub ? 16 : 14
              : 14,
          color: color ?? subtext,
          fontWeight: type!=null
              ? type==TextType.mini ? FontWeight.w500 : FontWeight.w600
              : isBold ? FontWeight.w600 :FontWeight.w500
      ),
    ).tr();
  }

}