import 'package:contacts_service/contacts_service.dart';
import 'package:expense_manager/widgets/inputs/single_select_tags.dart';
import 'package:flutter/material.dart';

import '../../db/model/cashbook.dart';

class CashbookViewModel {
  static late CashbookViewModel _instance;
  factory CashbookViewModel() {
    _instance = CashbookViewModel._internal();
    return _instance;
  }

  CashbookViewModel._internal();

  ValueNotifier cashBookType = ValueNotifier<int>(0);

  ValueNotifier memberRoleType = ValueNotifier<int>(0);

  ValueNotifier contactPermissionNotifier = ValueNotifier<int>(0);

  static Cashbook? cashbook;

  static TextEditingController cashbookNameController = TextEditingController();
  static TextEditingController memberEmailController = TextEditingController();

  List addedContacts = [];
  List<Contact> contacts = [];

  static List<TagItem> bookTypes = [
    TagItem(
        label: "Private Book",
        icon: Icons.book
    ),
    TagItem(
        label: "Group Book",
        icon: Icons.group
    ),
  ];

  static List<List<String>> permissions = [
    [
      "Add Cash In or Cash Out entries",
      "View entries by everyone",
      "View net balance & download PDF or Excel"
    ],
    [
      "View entries by everyone",
      "View net balance & download PDF or Excel"
    ],
    [
      "Add Cash In or Cash Out entries",
      "View entries by everyone",
      "View net balance and download PDF or Excel",
      "Edit & Delete entries",
      "Rename delete book and delete all entries",
      "Add or remove members",
      "Change member role and permissions",
      "Move or copy entries from one book to other book",
      "Edit categories and payment mode",
      "Access Book Activity and Entry's Edit History"
    ]
  ];

  static void clearValues(){
    cashbookNameController.clear();
    memberEmailController.clear();
  }
}