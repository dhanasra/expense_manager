

import 'package:easy_localization/easy_localization.dart';
import 'package:expense_manager/utils/extentions.dart';
import 'package:flutter/material.dart';

class DateTimeUtils {

  static String currentDateTimeInMillis(){
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  static String formatDate(DateTime time){
    return DateFormat("dd-MM-yyyy").format(time);
  }

  static String format(int time, {String? format}){
    return DateFormat(format ??"dd-MM-yyyy").format(DateTime.fromMicrosecondsSinceEpoch(time.toInt()));
  }

  static String getToday(String format){
    return DateFormat(format).format(DateTime.now());
  }

  static String formatTime(TimeOfDay time){
    return "${time.hour} : ${time.minute} ${time.period.name}";
  }

}