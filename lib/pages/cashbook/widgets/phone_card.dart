
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:expense_manager/widgets/button/button.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class PhoneCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final dynamic avatar;
  final bool isAdded;
  final VoidCallback onAdd;
  const PhoneCard({
    Key? key,
    this.avatar,
    required this.title,
    required this.subTitle,
    this.isAdded = false,
    required this.onAdd
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: avatar !=null
            ? Image.file(avatar)
            : Text(
          title.substring(0,1),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(blunt)
      ),
      trailing: isAdded
          ? const Icon(Icons.check_circle, color: Colors.green,)
          : GestureDetector(
            onTap: onAdd,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: primary),
                borderRadius: BorderRadius.circular(4)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: const Text("ADD", style: TextStyle(
                  color: primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 15
              )),
            ),
      ),
      title: Text(
          title, style: const TextStyle(
          color: text,
          fontWeight: FontWeight.w600,
          fontSize: 15
      )),
      subtitle: Text(subTitle, style: const TextStyle(
          color: subText,
          fontWeight: FontWeight.w500,
          fontSize: 12
      )),
    );
  }
}
