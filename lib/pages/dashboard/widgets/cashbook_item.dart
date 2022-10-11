
import 'package:currency_picker/currency_picker.dart';
import 'package:expense_manager/app/app.dart';
import 'package:expense_manager/app/app_routes.dart';
import 'package:expense_manager/db/model/cashbook.dart';
import 'package:expense_manager/pages/cashbook/cashbook_view_model.dart';
import 'package:expense_manager/pages/dashboard/dashboard_view_model.dart';
import 'package:expense_manager/utils/constants.dart';
import 'package:expense_manager/utils/date_time_utils.dart';
import 'package:expense_manager/utils/extentions.dart';
import 'package:expense_manager/widgets/inputs/option_drop_down.dart';
import 'package:expense_manager/widgets/text/get_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CashbookItem extends StatelessWidget {
  final Cashbook cashbook;
  final VoidCallback renameClick;
  final VoidCallback deleteClick;
  final VoidCallback onClick;
  const CashbookItem({
    Key? key,
    required this.renameClick,
    required this.cashbook,
    required this.deleteClick,
    required this.onClick
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var lastActivity = cashbook.activity[cashbook.activity.length-1];

    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundColor: primary10,
              radius: 18,
              child: Icon(
                FontAwesomeIcons.bookBookmark, size: 14, color: iconColor),
            ),
            const SizedBox(width: 12,),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetText.subTitleSmall(
                      cashbook.name,
                      type: TextType.sub,
                      color: text
                    ),
                    const SizedBox(height: 10,),
                    GetText.subTitleSmall(
                        "${lastActivity.action} at ${DateTimeUtils.format(lastActivity.at)} ",
                        type: TextType.mini,
                        color: promptColor
                    )
                  ],
                )
            ),
            Amount(
                  currencyCode: 'INR',
                  amount: cashbook.cashBalance?.netBalance??"0",
                  style: TextStyle(
                    color: cashbook.cashBalance!=null
                        ? Colors.green
                        : cashbook.cashBalance!.totalIn.toInt() >cashbook.cashBalance!.totalOut.toInt()
                        ? Colors.green : Colors.redAccent,
                    fontWeight: FontWeight.w600,
                    fontSize: 16
                  ),
            ),
            const SizedBox(width: 10,),
            SizedBox(
              width: 30,
              height: 30,
              child: OptionDropDown(
                menuItems: const [
                  OptionMenuItem(text: "Rename", icon: FontAwesomeIcons.pencil),
                  OptionMenuItem(text: "Duplicate book", icon: FontAwesomeIcons.copy),
                  OptionMenuItem(text: "Add Members", icon: FontAwesomeIcons.userPlus),
                  OptionMenuItem(text: "Delete Book", icon: FontAwesomeIcons.trash)
                ],
                onChanged: (val){
                  DashboardViewModel.selectedCashbook = cashbook;
                  if(val=="Rename"){
                    renameClick();
                  }else if(val=="Delete Book"){
                    deleteClick();
                  }else if(val=="Add Members"){
                    const App().setNavigation(context, AppRoutes.memberContactCreate);
                  }else{
                    CashbookViewModel.cashbook = cashbook;
                    const App().setNavigation(context, AppRoutes.cashbookDuplicateCreate);
                  }
                },
              ),
            )
          ],
        )),
    );
  }
}
