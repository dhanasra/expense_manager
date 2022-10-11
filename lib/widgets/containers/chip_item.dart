import 'package:expense_manager/utils/constants.dart';
import 'package:flutter/material.dart';

class ChipItem extends StatelessWidget {
  final String text;
  final Color? color;
  final bool noBorder;

  const ChipItem({
    Key? key,
    this.color,
    required this.text,
    this.noBorder = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
          text,
          style: TextStyle(
              fontSize: 12,
              color: color??primary
          )
      ),
      backgroundColor: bgLight,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: noBorder
                ? Colors.transparent : color?.withOpacity(0.1) ?? primary10,
        ),
        borderRadius: BorderRadius.circular(2)
      )
    );
  }
}
