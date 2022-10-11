import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class ContactButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ContactButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(double.infinity, 57)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(blunt),
                    side: const BorderSide(color: primary, width: 0.8)
                )),
                backgroundColor: MaterialStateProperty.all(Theme.of(context).backgroundColor),
                elevation: MaterialStateProperty.all(8)
            ),
            child: const Text("Add from contacts",
              style: TextStyle(
                  color: primary,
                  fontWeight: FontWeight.w500
              ),)
        ),
        const Positioned(
          left: 20, top: 0, bottom: 0,
          child: Icon(Icons.group_add_outlined, color: primary, size: 22,),)
      ],
    );
  }
}
