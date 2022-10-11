import 'package:expense_manager/pages/cashEntry/widgets/category_item.dart';
import 'package:expense_manager/utils/constants.dart';
import 'package:expense_manager/utils/dimension_utils.dart';
import 'package:expense_manager/utils/gap.dart';
import 'package:expense_manager/widgets/background.dart';
import 'package:expense_manager/widgets/button/flat_text_button.dart';
import 'package:expense_manager/widgets/inputs/switch_input.dart';
import 'package:expense_manager/widgets/text/get_text.dart';
import 'package:expense_manager/widgets/utils/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/button/button.dart';
import '../../../widgets/inputs/text_input.dart';
import '../../cashEntry/bloc/cash_entry_bloc.dart';
import '../../cashEntry/cash_entry_view_model.dart';

class CashEntryCategorySettingsPage extends StatelessWidget {
  const CashEntryCategorySettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CashEntryBloc, CashEntryState>(
      listener: (_,state){

      },
      child: const Background(
        isBackPressed: true,
        title: "Category Settings",
        child: MainBody(),
      ),
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ValueNotifier showCategoryNotifier = ValueNotifier(true);

    return ListView(
      padding: Dimensions.padding_20_30,
      children: [
        SwitchInput(
          onChanged: (val){
            showCategoryNotifier.value = val;
          },
          title: "show_category",
          subtitleOn: "show_category_desc_1",
          subtitleOff: "show_category_desc_2",
          switchOn: true,
        ),

        ValueListenableBuilder(
            valueListenable: showCategoryNotifier,
            builder: (_,__,___){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap.medium1,

                  FlatTextButton(
                    onClick: ()=>addNewCategory(context),
                    text: "Add New Category",
                    icon: Icons.add,
                    isEnable: showCategoryNotifier.value,
                  ),

                  Gap.big_35,

                  GetText.subTitleSmall(
                      "Categories From This Book",
                      color: showCategoryNotifier.value
                          ? null : promptColor
                  ),

                  Gap.medium1,

                  ListView.separated(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_,index){
                      return DeletableItem(
                          item: "Salary",
                          onDelete: (){},
                          isEnable: showCategoryNotifier.value,
                      );
                    },
                    separatorBuilder: (_,index){
                      return const Divider(color: Colors.transparent,);
                    },
                  )
                ],
              );
            }
        )

      ],
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

