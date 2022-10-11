import 'package:expense_manager/utils/constants.dart';
import 'package:flutter/material.dart';

import 'drop_down_2.dart';

class Dropdown extends StatefulWidget {
  final List<String> items;
  final String? value;
  const Dropdown({
    Key? key,
    required this.items,
    this.value
  }) : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String? selectedValue;

  @override
  void initState() {
    selectedValue = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButton2(
          items: widget.items.map(
                  (e)=>DropdownMenuItem(
                    value: e,
                    child: Text(e, style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),))
          ).toList(),
          bottomButtonText: "Add New Category",
          bottomButtonClick: (){},
          buttonDecoration: BoxDecoration(
              border: Border.all(color: promptColor),
              borderRadius: BorderRadius.circular(blunt)
          ),
          buttonPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          onChanged: (value) {
            setState(() {
              selectedValue = value.toString();
            });
          },
          isExpanded: true,
          value: selectedValue,
          itemHeight: 48,
          dropdownMaxHeight: 240,
          itemPadding: const EdgeInsets.only(left: 16, right: 16),
          dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),
          dropdownElevation: 8,
          offset: const Offset(0, 0),
      )
    );
  }
}
