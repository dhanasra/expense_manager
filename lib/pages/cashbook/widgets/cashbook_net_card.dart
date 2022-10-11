import 'package:currency_picker/currency_picker.dart';
import 'package:expense_manager/db/model/cashbook.dart';
import 'package:expense_manager/pages/cashbook/cashbook_view_model.dart';
import 'package:expense_manager/utils/constants.dart';
import 'package:expense_manager/utils/extentions.dart';
import 'package:expense_manager/widgets/containers/box.dart';
import 'package:expense_manager/widgets/text/get_text.dart';
import 'package:flutter/material.dart';

class CashbookNetCard extends StatelessWidget {
  const CashbookNetCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Cashbook? cashbook = CashbookViewModel.cashbook;
    return Box(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GetText.subTitleSmall("Net Balance", type: TextType.sub, color: text),
                Amount(
                  currencyCode: 'INR',
                  amount: cashbook?.cashBalance?.netBalance??"0",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                  ),
                )
              ],
            ),
            const Divider(height: 32,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GetText.normalText("Total In (+)" , color: subtext),
                Amount(
                  currencyCode: 'INR',
                  amount: cashbook?.cashBalance?.netBalance??"0",
                  style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                  ),
                )
              ],
            ),
            const Divider(color: Colors.transparent,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GetText.normalText("Total Out (-)", color: subtext),
                Amount(
                  currencyCode: 'INR',
                  amount: cashbook?.cashBalance?.netBalance??"0",
                  style: const TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                  ),
                )
              ],
            ),
            const Divider(height: 32,),
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GetText.subTitleSmall("VIEW REPORTS",color: primary),
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
