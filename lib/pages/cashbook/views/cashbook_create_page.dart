import 'package:dotted_border/dotted_border.dart';
import 'package:expense_manager/app/app.dart';
import 'package:expense_manager/app/app_routes.dart';
import 'package:expense_manager/pages/cashbook/bloc/cashbook_bloc.dart';
import 'package:expense_manager/pages/cashbook/cashbook_view_model.dart';
import 'package:expense_manager/utils/constants.dart';
import 'package:expense_manager/utils/gap.dart';
import 'package:expense_manager/widgets/background.dart';
import 'package:expense_manager/widgets/button/button.dart';
import 'package:expense_manager/widgets/inputs/single_select_tags.dart';
import 'package:expense_manager/widgets/toaster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/dimension_utils.dart';
import '../../../widgets/inputs/text_input.dart';

CashbookViewModel viewModel = CashbookViewModel();

class CashbookCreatePage extends StatelessWidget {
  const CashbookCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
        isBackPressed: true,
        title: "Create Cashbook",
        child: BlocListener<CashbookBloc, CashbookState>(
          listener: (_,state){
            if(state is CashbookCreated){
              CashbookViewModel.cashbook = state.cashbook;
              if(viewModel.cashBookType.value==0) CashbookViewModel.clearValues();
              const App().setNavigation(context, viewModel.cashBookType.value==0
                  ? AppRoutes.cashbook
                  : AppRoutes.memberCreate
              );
            }else if(state is Failure){
              ScaffoldMessenger.of(context).showSnackBar(Toaster.snack(content: state.message));
            }
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

    return  SingleChildScrollView(
        padding: Dimensions.padding_20,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextInput(
              autoFocus: true,
              controller: CashbookViewModel.cashbookNameController,
              labelText: "Cashbook name",
              hintText: "Enter cashbook name"),

          Gap.medium,

          SingleSelectTags(
              tags: CashbookViewModel.bookTypes,
              onSelected: (val)=>viewModel.cashBookType.value = val,
          ),

          Gap.small,

          ValueListenableBuilder(
              valueListenable: viewModel.cashBookType,
              builder: (_,__,___){
                return DottedBorder(
                    padding: const EdgeInsets.all(12),
                    color: information,
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        viewModel.cashBookType.value==0
                            ? 'Note - Only you will have access to private book'
                            : 'Note - You can add your staff, family or business partners and create group book',
                        style: const TextStyle(
                            color: information,
                            fontSize: 12,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    )
                );
              }
          ),

          Gap.big_50,

          BlocBuilder<CashbookBloc, CashbookState>(
              builder: (_,state){
                return ButtonWL(
                  isLoading: state is Loading,
                  widthChangeOnLoad: false,
                  onPressed: ()=>context.read<CashbookBloc>().add(
                      CreateCashbook(
                          name: CashbookViewModel.cashbookNameController.text,
                          isPrivate: viewModel.cashBookType.value==0
                      )
                  ),
                  label: "Save & Next",
                  width: double.infinity,
                  isBlunt: true,
                );
              })
        ])
    );
  }
}
