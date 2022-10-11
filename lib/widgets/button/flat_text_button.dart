import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class FlatTextButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final VoidCallback onClick;
  final bool isEnable;
  const FlatTextButton({
    Key? key,
    required this.onClick,
    required this.text,
    this.icon,
    this.isEnable = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: isEnable ? onClick : null,
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            alignment: Alignment.centerLeft),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: promptColor)
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Stack(
            children: [
              if(icon!=null)
              Align(
                  alignment : Alignment.centerLeft,
                  child: Icon(icon, color: isEnable ? primary : promptColor,)
              ),
              Align(
                  alignment : Alignment.center,
                  child: Text(text,
                    style: TextStyle(
                        color: isEnable ? primary : promptColor,
                        fontWeight: FontWeight.w600
                    ))
              ),
            ],
          ),
        )
    );
  }
}
