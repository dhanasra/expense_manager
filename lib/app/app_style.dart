import 'package:flutter/material.dart';

import '../utils/color_utils.dart';
import '../utils/constants.dart';

enum AppTheme {
  lightTheme,
  darkTheme
}

class AppStyle {

  static ThemeData lightTheme(BuildContext context){
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      primaryColor: Colors.red,
      primaryColorLight: promptColor,
      primaryColorDark: promptColor,
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      canvasColor: Colors.white,
      cardColor: Colors.white,
      shadowColor: const Color(0xFFF0F0F0),
      appBarTheme: AppBarTheme(
          color: Colors.white,
          foregroundColor: Colors.black,
          iconTheme: IconTheme.of(context).copyWith(color: primary, size: 34, ),
          elevation: 0
      ),
      iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black),
      textTheme: Theme.of(context).textTheme.apply(
        bodyColor: Colors.black.withOpacity(0.8), fontFamily: 'Poppins'
      ),
      primaryTextTheme: Theme.of(context).textTheme.apply(
          bodyColor: info, fontFamily: 'Poppins'
      ),
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: ColorUtils.materialColor(primary10),
      ),

      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: primary,
        selectionColor: primary,
        selectionHandleColor: primary,
      ),

      inputDecorationTheme: const InputDecorationTheme().copyWith(
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: promptColor,
        ),
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: promptColor),
          borderRadius: BorderRadius.circular(blunt)
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: promptColor),
            borderRadius: BorderRadius.circular(blunt)
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: error),
            borderRadius: BorderRadius.circular(blunt)
        ),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: error),
            borderRadius: BorderRadius.circular(blunt)
        ),
        disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: promptColor),
            borderRadius: BorderRadius.circular(blunt)
        )
      ),
      bottomSheetTheme: const BottomSheetThemeData().copyWith(
          backgroundColor: Colors.white
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData().copyWith(
          color: Colors.white
      ),
      buttonTheme: ButtonTheme.of(context).copyWith(buttonColor: primary),
      radioTheme: RadioTheme.of(context).copyWith(
          fillColor: MaterialStateProperty.all(primary),
          overlayColor: MaterialStateProperty.all(primary10),

      ),
      unselectedWidgetColor: border,
      checkboxTheme: CheckboxTheme.of(context).copyWith(
          fillColor: MaterialStateProperty.all(primary)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData().copyWith(
        selectedIconTheme: const IconThemeData().copyWith(size: 18),
        unselectedIconTheme: const IconThemeData().copyWith(size: 18),
        unselectedItemColor: promptColor,
        selectedItemColor: primary,
        backgroundColor: Colors.white,
        elevation: 16,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
      switchTheme: SwitchTheme.of(context).copyWith(
        thumbColor: MaterialStateProperty.all(primary),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData().copyWith(
        backgroundColor: primary,
        extendedTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
            letterSpacing: 1
        )
      ),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(primary),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(blunt),
              )),
              textStyle: MaterialStateProperty.all(const TextStyle(
                  color: primary,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  fontSize: 14
              ))
          )
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(primary),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(blunt),
              )),
              textStyle: MaterialStateProperty.all(const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
                letterSpacing: 1
              ))
          )
      ),

    );
  }

}