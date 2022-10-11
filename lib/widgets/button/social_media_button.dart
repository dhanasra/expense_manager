import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class SocialMediaButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final SocialMediaType type;

  const SocialMediaButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.type
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(160, 50)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(circle),
              )),
              padding: MaterialStateProperty.all(const EdgeInsets.only(left: 10)),
              backgroundColor: MaterialStateProperty.all(
                  type == SocialMediaType.google ? Colors.white : secondary),
              foregroundColor: MaterialStateProperty.all(
                  type == SocialMediaType.google ? subText : Colors.white),
              elevation: MaterialStateProperty.all(8)
          ),
          child: Text(label),
        ),
        Positioned(
          left: 10, top: 0, bottom: 0,
          child: Image.asset(
            "$appAssets${type==SocialMediaType.google ?'google.png':'facebook.png'}", width: 20, height: 20,),
        ),
      ]
    );
  }
}
