import 'package:expense_manager/utils/constants.dart';
import 'package:expense_manager/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/dimension_utils.dart';
import '../../../utils/gap.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/button/flat_text_button.dart';
import '../../../widgets/inputs/switch_input.dart';
import '../../../widgets/inputs/text_input.dart';
import '../../../widgets/text/get_text.dart';
import '../../../widgets/utils/custom_bottom_sheet.dart';
import '../../cashEntry/bloc/cash_entry_bloc.dart';
import '../../cashEntry/cash_entry_view_model.dart';
import '../../cashEntry/widgets/category_item.dart';

class CashEntryPaymentModeSettingsPage extends StatelessWidget {
  const CashEntryPaymentModeSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CashEntryBloc, CashEntryState>(
      listener: (_,state){

      },
      child: const Background(
        isBackPressed: true,
        title: "Payment Mode Settings",
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
          title: "show_payment_mode",
          subtitleOn: "show_payment_mode_desc_1",
          subtitleOff: "show_payment_mode_desc_2",
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
                    text: "Add Payment Mode",
                    icon: Icons.add,
                    isEnable: showCategoryNotifier.value,
                  ),

                  Gap.big_35,

                  GetText.subTitleSmall(
                      "Payment Modes From This Book",
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
                        item: "Online",
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
              title: "Create Payment Mode",
              children: [
                TextInput(
                    controller: CashEntryViewModel.categoryController,
                    labelText: "Payment Mode",
                    hintText: "Enter Payment Mode"
                ),
                Gap.big_35,
                BlocBuilder<CashEntryBloc, CashEntryState>(
                    builder: (context,state){
                      return ButtonWL(
                        isLoading: state is Loading,
                        widthChangeOnLoad: false,
                        onPressed: ()=>{},
                        label: "Add Payment Mode",
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

