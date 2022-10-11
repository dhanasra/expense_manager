import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../widgets/text/get_text.dart';

class DeletableItem extends StatelessWidget {
  final String item;
  final VoidCallback onDelete;
  final bool isEnable;
  const DeletableItem({
    Key? key,
    required this.item,
    required this.onDelete,
    this.isEnable = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: promptColor),
          borderRadius: BorderRadius.circular(4)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: isEnable ? Colors.green : promptColor,),
          const SizedBox(width: 20,),
          Expanded(child: GetText.normalText(
              item, color: isEnable ? null : promptColor
          )),
          const SizedBox(width: 20,),
          IconButton(
            onPressed: isEnable ? onDelete : null,
            icon: Icon(Icons.delete, color: isEnable ? error50 : promptColor, size: 24,),
            splashRadius: 18,
          )
        ],
      ),
    );
  }
}
