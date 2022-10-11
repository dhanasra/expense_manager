import 'package:currency_picker/currency_picker.dart';
import 'package:expense_manager/db/model/cash_entry.dart';
import 'package:expense_manager/pages/cashEntry/cash_entry_view_model.dart';
import 'package:expense_manager/widgets/containers/box.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../widgets/containers/chip_item.dart';
import '../../../widgets/text/get_text.dart';

class EntryDetailCard extends StatelessWidget {
  const EntryDetailCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    CashEntry cashEntry = CashEntryViewModel.cashEntry!;
    bool isCashIn = cashEntry.type == "CASH IN";

    return Box(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GetText.subTitleSmall(
                    isCashIn ? "CASH IN" : "CASH OUT",
                    color: isCashIn ? success : error
                ),
                GetText.subTitleSmall(
                    "Balance : ${cashEntry.entryBalance.balance}",
                    type: TextType.mini,
                    color: information
                )
              ],
            ),
            const Divider(color: Colors.transparent, height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
              ],
            ),
            if(cashEntry.entryBalance.category!=null || cashEntry.entryBalance.paymentMode!=null)
            const Divider(),
            GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetText.subTitleSmall("EDIT ENTRY",color: primary),
                    const SizedBox(width: 10,),
                    const Icon(Icons.arrow_forward_ios_rounded, color: primary, size: 18,)
                  ],
                )
            )
          ],
        )
    );
  }
}
