import 'package:expense_manager/widgets/button/button.dart';
import 'package:expense_manager/widgets/containers/box.dart';
import 'package:expense_manager/widgets/text/get_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/constants.dart';

class EmptyItem extends StatelessWidget {
  final VoidCallback onClick;
  final String title;
  final String btnText;
  final String subtitle;
  const EmptyItem({
    Key? key,
    required this.onClick,
    required this.title,
    required this.btnText,
    required this.subtitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
          color: bgLight
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(
          children: [
            GetText.subTitleSmall(title, type: TextType.sub, color: text),
            const SizedBox(height: 8,),
            GetText.subTitleSmall(
                subtitle,
                type: TextType.mini,
                color: promptColor,
                align: TextAlign.center
            ),
            const SizedBox(height: 20,),
            const Icon(FontAwesomeIcons.box, color: promptColor, size: 45,),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: onClick,
              child: Box(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(FontAwesomeIcons.plus, color: primary, size: 16,),
                    const SizedBox(width: 10,),
                    GetText.subTitleSmall(btnText, color: primary)
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}
