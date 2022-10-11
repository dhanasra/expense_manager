import 'package:expense_manager/widgets/inputs/checkbox_list.dart';
import 'package:expense_manager/widgets/text/get_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/dimension_utils.dart';
import '../../../utils/gap.dart';
import '../../../widgets/background.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/inputs/text_input.dart';
import '../bloc/cashbook_bloc.dart';
import '../cashbook_view_model.dart';

class CashbookDuplicatePage extends StatelessWidget {
  const CashbookDuplicatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
        isBackPressed: true,
        title: "Duplicate Cashbook",
        child: BlocListener<CashbookBloc, CashbookState>(
          listener: (_,state){

          },
          child: const MainBody(),
        )
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: Dimensions.padding_20,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              GetText.normalText("Step 1: Choose New Book Name"),
              Gap.medium,
              TextInput(
                  controller: CashbookViewModel.cashbookNameController,
                  labelText: "Cashbook name",
                  hintText: "Enter cashbook name"),

              Gap.big_35,

              GetText.normalText("Step 1: Choose Settings to duplicate"),
              Gap.medium,
              CheckboxList(
                  items: const [
                    "Members & Roles",
                    "Categories",
                    "Payment Modes",
                    "Party Settings"
                  ],
                  isAllSelected: true,
                  onChanged: (val){}
              ),


              Gap.big_50,

              BlocBuilder<CashbookBloc, CashbookState>(
                  builder: (_,state){
                    return ButtonWL(
                      isLoading: state is Loading,
                      widthChangeOnLoad: false,
                      onPressed: ()=>{},
                      label: "Add New Book",
                      width: double.infinity,
                      isBlunt: true,
                    );
                  })
            ])
    );
  }
}

