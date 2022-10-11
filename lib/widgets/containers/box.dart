import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class Box extends StatelessWidget {
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double borderRadius;
  final Widget child;
  final Color? color;

  const Box({
    Key? key,
    required this.child,
    this.padding,
    this.height,
    this.width,
    this.borderRadius = 8,
    this.margin,
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: color ?? Theme.of(context).cardColor,
        boxShadow: const [
          BoxShadow(color: border, spreadRadius: 0, blurRadius: 10)
        ]
      ),
      child: child
    );
  }
}
