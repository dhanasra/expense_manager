import 'package:expense_manager/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../app/app.dart';
import '../utils/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  final bool isBackPressed;
  final AppBar? appBar;
  final String? title;
  final List<Widget>? actions;
  final VoidCallback? onBackPress;

  const Background({
    Key? key,
    required this.child,
    this.isBackPressed = false,
    this.appBar,
    this.title,
    this.actions,
    this.onBackPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isBackPressed ? PreferredSize(
          preferredSize: const Size(double.infinity, 65),
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child:CircleAvatar(
                radius: 8,
                backgroundColor: bgLight,
                child: IconButton(
                  icon: const Icon(FontAwesomeIcons.arrowLeft, size: 22, color: iconColor),
                  onPressed: onBackPress??()=>const App().setBackNavigation(context),
                  splashRadius: 20,
                ),
              ),
            ),
            elevation: 2,
            actions: actions,
            title: title!=null ? Text(
                title!.capitalized(), style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18
            )) : null,
          )
      ) : null,
      body: SafeArea(
        child: child,
      ),
    );
  }
}
