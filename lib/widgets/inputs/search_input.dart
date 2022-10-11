import 'package:expense_manager/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchInput extends StatelessWidget {
  final ValueChanged onChanged;
  final VoidCallback onSortClick;
  const SearchInput({
    Key? key,
    required this.onSortClick,
    required this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child:  TextField(
              decoration: const InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: promptColor,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "Search by cashbook name...",
                  prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass)
              ),
              onChanged: onChanged,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
              ),
            )
        ),
        GestureDetector(
          onTap: onSortClick,
          child: const Icon(FontAwesomeIcons.sort, color: promptColor,),
        )
      ],
    );
  }
}
