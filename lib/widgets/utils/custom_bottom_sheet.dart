import 'package:expense_manager/widgets/text/get_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../app/app.dart';
import '../../utils/constants.dart';

class CustomBottomSheet {

  static showCustomBottomSheet({
    required BuildContext buildContext,
    required Widget child
  }){
    showModalBottomSheet<dynamic>(
        context: buildContext,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                topLeft:  Radius.circular(8)
            )
        ),
        builder: (_){
          return Padding(
              padding: MediaQuery.of(buildContext).viewInsets,
              child:Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: child
              ));
        }
    );
  }

  static showCustomBottomSheetWithBloc({
    required BuildContext buildContext,
    required Widget Function(BuildContext) child
  }){
    showModalBottomSheet<dynamic>(
        context: buildContext,
        isScrollControlled: true,
        enableDrag: false,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                topLeft:  Radius.circular(8)
            )
        ),
        builder: child
    );
  }

  static bottomSheetChild({
    required List<Widget> children,
    required BuildContext context,
    String? title,
    bool isClosable = true,
    VoidCallback? onClose
  }){

    return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child:Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if(title!=null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          title, style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16
                      )),
                      if(isClosable)
                      CircleAvatar(
                        backgroundColor: bgLight,
                        child: IconButton(
                          icon: const Icon(FontAwesomeIcons.xmark, size: 20, color: iconColor),
                          onPressed: (){
                            onClose!=null ? onClose() : null;
                            const App().setBackNavigation(context);
                          },
                          splashRadius: 20,
                        ),
                      )
                    ],
                  ),

                  if(title!=null)
                  const Divider(height: 32,),

                  ...children
                ]
            )
        )
    );
  }

}