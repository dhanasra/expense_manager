import 'package:expense_manager/app/app.dart';
import 'package:expense_manager/app/app_routes.dart';
import 'package:expense_manager/db/model/activity.dart';
import 'package:expense_manager/db/model/cash_entry.dart';
import 'package:expense_manager/db/model/default.dart';
import 'package:expense_manager/db/model/entry_balance.dart';
import 'package:expense_manager/pages/cashbook/bloc/cashbook_bloc.dart';
import 'package:expense_manager/pages/cashbook/cashbook_view_model.dart';
import 'package:expense_manager/pages/cashbook/widgets/cash_entry_item.dart';
import 'package:expense_manager/pages/cashbook/widgets/cashbook_net_card.dart';
import 'package:expense_manager/utils/dimension_utils.dart';
import 'package:expense_manager/utils/gap.dart';
import 'package:expense_manager/widgets/background.dart';
import 'package:expense_manager/widgets/button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/constants.dart';
import '../../../widgets/inputs/option_drop_down.dart';

class CashbookPage extends StatelessWidget {
  const CashbookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          const App().setNavigation(context, AppRoutes.home);
          return false;
        },
        child: Background(
            isBackPressed: true,
            title: CashbookViewModel.cashbook!.name,
            onBackPress: ()=>const App().setNavigation(context, AppRoutes.home),
          actions: [
            IconButton(
              onPressed: ()=>const App().setNavigation(context, AppRoutes.cashEntryFieldSettings),
              icon: const Icon(Icons.person_add_alt, color: primary, size: 24,),
              splashRadius: 20,
            ),
            IconButton(
              onPressed: ()=>const App().setNavigation(context, AppRoutes.cashEntryFieldSettings),
              icon: const Icon(Icons.picture_as_pdf_outlined, color: primary, size: 24,),
              splashRadius: 20,
            ),
            SizedBox(
              width: 50,
              height: 28,
              child: OptionDropDown(
                iconColor: primary,
                menuItems: const [
                  OptionMenuItem(text: "Book Settings", icon: FontAwesomeIcons.gear),
                  OptionMenuItem(text: "Book Activity", icon: FontAwesomeIcons.clock),
                  OptionMenuItem(text: "Delete All Entries", icon: FontAwesomeIcons.trash),
                  OptionMenuItem(text: "Excel Report", icon: FontAwesomeIcons.copy)
                ],
                onChanged: (val){

                },
              ),
            )
          ],
            child: BlocListener<CashbookBloc, CashbookState>(
              listener: (_,state){

              },
              child: Stack(
                fit: StackFit.expand,
                children: [
                  const MainBody(),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: [
                          Expanded(child: ButtonWL(
                              isLoading: false,
                              onPressed: (){
                                const App().setNavigation(context, AppRoutes.cashEntryCreate);
                              },
                              isBlunt: true,
                              label: "CASH IN",
                              bgColor: success,
                              icon: Icons.add,
                              margin: const EdgeInsets.fromLTRB(20, 10, 10, 30),
                          )),
                          Expanded(child: ButtonWL(
                              isLoading: false,
                              onPressed: (){
                                const App().setNavigation(context, AppRoutes.cashEntryCreate);
                              },
                              isBlunt: true,
                              bgColor: error,
                              icon: Icons.remove,
                              label: "CASH OUT",
                              margin: const EdgeInsets.fromLTRB(10, 10, 20, 30)
                          )),
                        ],
                      )
                  )
                ],
              ),
            ),
        )
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: Dimensions.pagePadding,
      children: const [
        CashbookNetCard(),
        Gap.big_35,
        CashEntryItem(
          cashEntry: CashEntry(
              id: "1",
              entryBalance: EntryBalance(
                  amount: "500",
                  balance: "1500",
              ),
              activity: [
                Activity(
                    action: "Created",
                    by: "Dhana",
                    at: 1665471508464
                )
              ],
              type: 'CASH OUT'
          )
        )
      ],
    );
  }
}
