import 'package:flutter/material.dart';

class SingleSelect extends StatefulWidget {
  final List<String> items;
  final ValueChanged onChanged;
  const SingleSelect({
    Key? key,
    required this.items,
    required this.onChanged
  }) : super(key: key);

  @override
  State<SingleSelect> createState() => _SingleSelectState();
}

class _SingleSelectState extends State<SingleSelect> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          labelText: "Category",
          hintText: "Select Category",
        ),
        items: widget.items.map(
                (item){
              return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
              );
            }
        ).toList(),
        value: null,
        isExpanded: true,
        onChanged: widget.onChanged
    );
  }
}
