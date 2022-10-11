import 'package:expense_manager/app/app_routes.dart';
import 'package:expense_manager/pages/cashEntry/cash_entry_view_model.dart';
import 'package:expense_manager/utils/constants.dart';
import 'package:expense_manager/utils/gap.dart';
import 'package:expense_manager/widgets/background.dart';
import 'package:expense_manager/widgets/inputs/radio_list.dart';
import 'package:expense_manager/widgets/inputs/single_select_tags.dart';
import 'package:expense_manager/widgets/inputs/text_input.dart';
import 'package:expense_manager/widgets/text/get_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/app.dart';
import '../../../utils/dimension_utils.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/utils/custom_bottom_sheet.dart';
import '../../cashEntry/bloc/cash_entry_bloc.dart';

class CashEntryCategoryPage extends StatelessWidget {
  const CashEntryCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CashEntryBloc, CashEntryState>(
        listener: (_,state){

        },
        child: Background(
          isBackPressed: true,
          title: "Choose Category",
          actions: [
            IconButton(
                onPressed: ()=>const App().setNavigation(context, AppRoutes.cashEntryCategorySettings),
                icon: const Icon(Icons.settings, color: primary, size: 24,),
                splashRadius: 20,
            ),
          ],
          child: Stack(
            children: [
              const MainBody(),
              Positioned(
                  right: 20,
                  bottom: 40,
                  child: FloatingActionButton.extended(
                      onPressed: ()=>addNewCategory(context),
                      label: const Text("Add new", style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                          letterSpacing: 1
                      )),
                      isExtended: true,
                      icon: const Icon(Icons.add, color: Colors.white,),
                  )
              )
            ],
          ),
        ),
    );
  }

  void addNewCategory(buildContext){
    CustomBottomSheet.showCustomBottomSheetWithBloc(
      buildContext: buildContext,
      child: (context){
        return BlocProvider.value(
          value: BlocProvider.of<CashEntryBloc>(buildContext),
          child: CustomBottomSheet.bottomSheetChild(
              context: context,
              title: "Create Category",
              children: [
                TextInput(
                    controller: CashEntryViewModel.categoryController,
                    labelText: "Category",
                    hintText: "Enter category"
                ),
                Gap.big_35,
                BlocBuilder<CashEntryBloc, CashEntryState>(
                    builder: (context,state){
                      return ButtonWL(
                        isLoading: state is Loading,
                        widthChangeOnLoad: false,
                        onPressed: ()=>{},
                        label: "Add Category",
                        width: double.infinity,
                        isBlunt: true,
                      );
                    }
                )
              ]
          ),
        );
      },
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CashEntryViewModel viewModel = CashEntryViewModel();
    return ListView(
      padding: Dimensions.padding_20_10,
      children: [
        Gap.medium1,
        GetText.subTitleSmall("Categories in this book"),
        Gap.medium,
        RadioList(
            items: ["one","two"],
            onChanged: (val){},
            defaultItem: "No Category"
        ),
        Gap.big_35,
        GetText.subTitleSmall("Suggested Categories"),
        Gap.medium,
        SingleSelectTags(
            tags: List.generate(viewModel.suggestedCategories.length,
                    (index) => TagItem(label: viewModel.suggestedCategories[index])).toList(),
            onSelected: (val){}
        )
      ],
    );
  }
}

