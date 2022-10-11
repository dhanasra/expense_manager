import 'package:expense_manager/db/model/cashbook.dart';
import 'package:flutter/cupertino.dart';

class DashboardViewModel {
  static late DashboardViewModel _instance;
  factory DashboardViewModel() {
    _instance = DashboardViewModel._internal();
    return _instance;
  }

  DashboardViewModel._internal(){
    init();
  }

  void init(){

  }

  static TextEditingController renameController = TextEditingController();
  static TextEditingController deleteController = TextEditingController();

  static Cashbook? selectedCashbook;


}