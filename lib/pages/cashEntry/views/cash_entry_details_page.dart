import 'package:expense_manager/pages/cashEntry/bloc/cash_entry_bloc.dart';
import 'package:expense_manager/pages/cashEntry/cash_entry_view_model.dart';
import 'package:expense_manager/pages/cashEntry/widgets/entry_detail_card.dart';
import 'package:expense_manager/utils/dimension_utils.dart';
import 'package:expense_manager/utils/extentions.dart';
import 'package:expense_manager/utils/gap.dart';
import 'package:expense_manager/widgets/background.dart';
import 'package:expense_manager/widgets/button/button.dart';
import 'package:expense_manager/widgets/containers/box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants.dart';
import '../../../utils/date_time_utils.dart';
import '../../../widgets/text/get_text.dart';

class CashEntryDetailsPage extends StatelessWidget {
  const CashEntryDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CashEntryBloc, CashEntryState>(
        listener: (_,state){

        },
        child: const Background(
          title: "Entry Details",
          isBackPressed: true,
          child: MainBody(),
        ),
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: Dimensions.pagePadding,
      children: [
        const EntryDetailCard(),
        Gap.medium1,
        Box(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GetText.subTitleSmall(
                        "Created by",
                        type: TextType.mini,
                        color: success
                    ),
                    // GetText.subTitleSmall(
                    //     CashEntryViewModel.cashEntry!.activity[].by,
                    //     type: TextType.mini,
                    //     color: success
                    // )
                  ],
                ),
                Gap.small,
                // GetText.subTitleSmall(
                //     DateTimeUtils.format(
                //         CashEntryViewModel.cashEntry!.defaultData.updatedAt,
                //         format: "dd MMMM yyyy, hh : mm a"
                //     ),
                //     type: TextType.mini,
                //     color: subtext
                // )
              ],
            )
        )
      ],
    );
  }
}
