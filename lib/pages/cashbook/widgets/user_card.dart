import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class UserCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String? avatar;
  const UserCard({
    Key? key,
    this.avatar,
    required this.title,
    required this.subTitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(
          title.substring(0,1),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(blunt)
      ),
      tileColor: primary10,
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
