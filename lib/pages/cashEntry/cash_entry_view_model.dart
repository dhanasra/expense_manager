import 'package:expense_manager/widgets/inputs/single_select_tags.dart';
import 'package:flutter/cupertino.dart';

import '../../db/model/cash_entry.dart';

class CashEntryViewModel {
  static late CashEntryViewModel _instance;
  factory CashEntryViewModel() {
    _instance = CashEntryViewModel._internal();
    return _instance;
  }

  CashEntryViewModel._internal(){
    init();
  }

  void init(){
    paymentModes = [
      TagItem(label: "Cash"),
      TagItem(label: "Online")
    ];
    suggestedCategories = [
      "Salary","Income From Rent","In hand","Sale","Investment","Bonus","Profit","Deposit"
    ];
    suggestedPaymentModes = [
      "Cash","Online","PhonePe","Paytm","Google Pay","Bank Account","Net Banking","Debit Card","Credit Card"
    ];
  }

  static CashEntry? cashEntry;

  static bool isCashAdd = true;

  static TextEditingController amountController = TextEditingController();
  static TextEditingController partyNameController = TextEditingController();
  static TextEditingController remarkController = TextEditingController();
  static TextEditingController categoryController = TextEditingController();
  static TextEditingController paymentModeController = TextEditingController();
  late final List<TagItem> paymentModes;

  late final List<String> suggestedCategories;
  late final List<String> suggestedPaymentModes;

}