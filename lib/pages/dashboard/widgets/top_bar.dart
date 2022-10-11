import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/constants.dart';
import '../../../widgets/containers/box.dart';
import '../../../widgets/text/get_text.dart';

class TopBar extends StatelessWidget {
  final String name;
  const TopBar({
    Key? key,
    required this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Box(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(commonAvatarOffline),
          ),
          const SizedBox(width: 12,),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetText.highlightedTitle("Hey $name !"),
                  const SizedBox(height: 6,),
                  GetText.subTitleSmall(
                      "Check your expenses",
                      type: TextType.mini,
                      color: promptColor
                  )
                ],
              )
          ),
          IconButton(
              onPressed: (){},
              icon: const Icon(
                FontAwesomeIcons.solidBell,
                color: promptColor,
                size: 20,
              )
          )
        ],
      ),
    );
  }
}
