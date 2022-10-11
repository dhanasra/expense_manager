import 'package:expense_manager/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'drop_down_2.dart';

class OptionDropDown extends StatefulWidget {
  final List<OptionMenuItem> menuItems;
  final ValueChanged<String> onChanged;
  final Color? iconColor;
  const OptionDropDown({
    Key? key,
    required this.menuItems,
    required this.onChanged,
    this.iconColor
  }) : super(key: key);

  @override
  State<OptionDropDown> createState() => _OptionDropDownTestState();
}

class _OptionDropDownTestState extends State<OptionDropDown> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            customButton: Icon(
              FontAwesomeIcons.ellipsisVertical,
              size: 22,
              color: widget.iconColor ?? subtext,
            ),
            items: [
              ...widget.menuItems.map(
                    (item) =>
                    DropdownMenuItem<OptionMenuItem>(
                      value: item,
                      child: MenuItems.buildItem(item),
                    ),
              ),
            ],
            onChanged: (OptionMenuItem? val)=>widget.onChanged(val!=null ? val.text : ""),
            itemHeight: 48,
            itemPadding: const EdgeInsets.only(left: 16, right: 16),
            dropdownWidth: 180,
            dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
            dropdownElevation: 8,
            offset: const Offset(0, 0),
          ),
        ),
      ),
    );
  }
}

class OptionMenuItem {
  final String text;
  final IconData icon;

  const OptionMenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static Widget buildItem(OptionMenuItem item) {
    return Row(
      children: [
        Icon(
            item.icon,
            color: promptColor,
            size: 16
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          item.text,
          style: const TextStyle(
            color: text,
            fontWeight: FontWeight.w500,
            fontSize: 14
          ),
        ),
      ],
    );
  }
}