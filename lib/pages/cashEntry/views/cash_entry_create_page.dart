import 'package:expense_manager/app/app.dart';
import 'package:expense_manager/app/app_routes.dart';
import 'package:expense_manager/pages/cashEntry/bloc/cash_entry_bloc.dart';
import 'package:expense_manager/pages/cashEntry/cash_entry_view_model.dart';
import 'package:expense_manager/utils/constants.dart';
import 'package:expense_manager/utils/gap.dart';
import 'package:expense_manager/widgets/background.dart';
import 'package:expense_manager/widgets/button/button.dart';
import 'package:expense_manager/widgets/inputs/date_picker.dart';
import 'package:expense_manager/widgets/inputs/single_select_tags.dart';
import 'package:expense_manager/widgets/inputs/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/dimension_utils.dart';
import '../../../widgets/inputs/image_picker.dart';
import '../../../widgets/inputs/text_input.dart';

class CashEntryCreatePage extends StatelessWidget {
  const CashEntryCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
        isBackPressed: true,
        title:"Add ${CashEntryViewModel.isCashAdd ? "Cash In" : "Cash Out"} Entry",
        actions: [
          IconButton(
            onPressed: ()=>const App().setNavigation(context, AppRoutes.cashEntryFieldSettings),
            icon: const Icon(Icons.settings, color: primary, size: 24,),
            splashRadius: 20,
          ),
        ],
        child: BlocListener<CashEntryBloc, CashEntryState>(
          listener: (_,state){

          },
          child: Stack(
            children: [
              MainBody(
                viewModel: CashEntryViewModel(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: border)
                    )
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 5,
                          child: ButtonWL(
                              isLoading: false,
                              onPressed: (){},
                              label: "Save & Add New",
                              isBlunt: true,
                              isBorderOnly: true,
                          )
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                          flex: 3,
                          child: ButtonWL(
                            isLoading: false,
                            onPressed: (){},
                            label: "Save",
                            isBlunt: true,
                          )
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({
    Key? key,
    required this.viewModel
  }) : super(key: key);
  
  final CashEntryViewModel viewModel;

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
        padding: Dimensions.padding_20,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              DatePicker(),
              TimePicker()
            ],
          ),

          Gap.medium1,

          TextInput(
              controller: CashEntryViewModel.amountController,
              labelText: "Amount",
              hintText: "Enter amount"),

          Gap.medium1,

          TextInput(
              controller: CashEntryViewModel.partyNameController,
              labelText: "Party",
              hintText: "Party name",
              endIcon: Icons.arrow_drop_down,
              isEnabled: false,
              onClick: (){},
          ),

          Gap.medium1,

          TextInput(
              controller: CashEntryViewModel.remarkController,
              labelText: "Remark",
              hintText: "Remark ( Item, Person, etc )"),

          Gap.medium1,

          const ImagePicker(),

          Gap.medium1,

          TextInput(
            controller: CashEntryViewModel.partyNameController,
            labelText: "Category",
            hintText: "Choose category",
            endIcon: Icons.arrow_drop_down,
            isEnabled: false,
            onClick: ()=>const App().setNavigation(context, AppRoutes.cashEntryCategory),
          ),

          Gap.medium1,

          const Text("Payment mode",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600
            ),
          ),

          Gap.medium1,

          Row(
            children: [
              SingleSelectTags(
                  tags: viewModel.paymentModes,
                  onSelected: (val){}
              ),
              const SizedBox(width: 10,),
              GestureDetector(
                onTap: ()=>const App().setNavigation(context, AppRoutes.cashEntryPaymentModes),
                child: const Text("View more", style: TextStyle(
                  color: primary,
                  fontWeight: FontWeight.w600
                )),
              )
            ],
          ),

          const SizedBox(height: 100,)
        ])
    );
  }
}

