import 'package:expense_manager/widgets/text/get_text.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/dimension_utils.dart';

class SubtitleViewAll extends StatelessWidget {
  final String subtitle;
  final VoidCallback onViewAll;
  const SubtitleViewAll({
    Key? key,
    required this.subtitle,
    required this.onViewAll
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 10),
      margin: Dimensions.pagePadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GetText.subTitleSmall(subtitle, color: subtext, type: TextType.sub),
          GestureDetector(
              onTap: (){},
              child: const Text("View all", style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: secondary
              ))
          )
        ],
      ),
    );
  }
}
