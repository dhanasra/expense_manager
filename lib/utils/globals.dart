import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:expense_manager/utils/date_time_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Globals {

  static String name = "";
  static String photo = "";
  static String theme = "";
  static String language = "";
  static bool isPrime = false;

  static generateId(String tag) async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo info = await DeviceInfoPlugin().androidInfo;
      String? id = info.id?.substring(0,4);
      return "$tag-${id??Globals.name}-${DateTimeUtils.currentDateTimeInMillis()}";
    } else if (Platform.isIOS) {
      IosDeviceInfo info = await DeviceInfoPlugin().iosInfo;
      String? id = info.name?.substring(0,5);
      return "$tag-${id ?? Globals.name}-${DateTimeUtils.currentDateTimeInMillis()}";
    }
  }

  static getImageFile(dynamic file){
    try{
      return File.fromRawPath(file);
    }catch(e){
      return null;
    }
  }

}