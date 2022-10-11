import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class LanguagesDropDown extends StatefulWidget {
  final ValueChanged onChanged;
  const LanguagesDropDown({
    Key? key,
    required this.onChanged
  }) : super(key: key);

  @override
  State<LanguagesDropDown> createState() => _LanguagesDropDownState();
}

class _LanguagesDropDownState extends State<LanguagesDropDown> {
  @override
  Widget build(BuildContext context) {

    return DropdownButtonFormField<Map<String,String>>(
        decoration: const InputDecoration(
          labelText: "Language",
        ),
        items: languages.map((item){
              return DropdownMenuItem<Map<String,String>>(
                  value: item,
                  child: Row(
                    children: [
                      Text("${item["name"]}",style:  const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ))
                    ],
                  )
              );
            }
        ).toList(),
        value: null,
        onChanged: widget.onChanged
    );
  }
}
