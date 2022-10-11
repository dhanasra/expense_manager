import 'package:currency_picker/currency_picker.dart';
import 'package:expense_manager/app/app.dart';
import 'package:expense_manager/app/app_routes.dart';
import 'package:expense_manager/db/model/cash_entry.dart';
import 'package:expense_manager/pages/cashEntry/cash_entry_view_model.dart';
import 'package:expense_manager/utils/constants.dart';
import 'package:expense_manager/utils/date_time_utils.dart';
import 'package:expense_manager/widgets/containers/box.dart';
import 'package:expense_manager/widgets/containers/chip_item.dart';
import 'package:expense_manager/widgets/text/get_text.dart';
import 'package:flutter/material.dart';

class CashEntryItem extends StatelessWidget {
  final CashEntry cashEntry;
  const CashEntryItem({
    Key? key,
    required this.cashEntry
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isCashIn = cashEntry.type == "CASH IN";
    var lastActivity = cashEntry.activity[cashEntry.activity.length-1];
    return GestureDetector(
      onTap: (){
        CashEntryViewModel.cashEntry = cashEntry;
        const App().setNavigation(context, AppRoutes.cashEntryDetails);
      },
      child: Box(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // GetText.subTitleSmall(
                  //     DateTimeUtils.format(
                  //         cashEntry.defaultData.updatedAt, format: "MMMM dd, yyyy"),
                  //     type: TextType.mini
                  // ),
                  GetText.subTitleSmall(
                      "Balance : ${cashEntry.entryBalance.balance}",
                      type: TextType.mini,
                      color: information
                  )
                ],
              ),
              const Divider(color: Colors.transparent, height: 8,),
              Row(
                children: [
                  if(cashEntry.entryBalance.category!=null)
                  ChipItem(
                      text: cashEntry.entryBalance.category!
                  ),
                  if(cashEntry.entryBalance.category!=null)
                  const SizedBox(width: 10,),
                  if(cashEntry.entryBalance.paymentMode!=null)
                  ChipItem(
                      text: cashEntry.entryBalance.paymentMode!
                  ),
                  const Spacer(),
                  Amount(
                    currencyCode: 'INR',
                    amount: cashEntry.entryBalance.amount,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: isCashIn ? success : error
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Icon(
                      isCashIn ? Icons.arrow_upward : Icons.arrow_downward,
                      color: isCashIn ? success : error
                  )
                ],
              ),
              const Divider(height: 32,),
              Row(
                children: [
                  GetText.subTitleSmall(
                      "${lastActivity.action} by ${lastActivity.by}",
                      type: TextType.mini,
                      color: success
                  ),
                  const SizedBox(width: 5,),
                  GetText.subTitleSmall(
                      "at ${DateTimeUtils.format(lastActivity.at)} ",
                      type: TextType.mini,
                      color: subtext
                  )
                ],
              )
            ],
          )
      ),
    );
  }
}
