import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class ImagePicker extends StatefulWidget {
  const ImagePicker({Key? key}) : super(key: key);

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: primary),
            borderRadius: BorderRadius.circular(8),
            color: primary10
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Row(children: const [
            Icon(Icons.camera_alt_outlined, color: primary, size: 20,),
            SizedBox(width: 10,),
            Text("Attach Image",
              style: TextStyle(
                  fontSize: 14,
                  color: primary,
                  fontWeight: FontWeight.w500
              ),
            )
          ]),
        )
      ],
    );
  }
}
