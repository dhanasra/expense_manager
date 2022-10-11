import 'package:expense_manager/utils/constants.dart';
import 'package:expense_manager/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/app.dart';
import '../../../app/app_routes.dart';
import '../../../utils/dimension_utils.dart';
import '../../../utils/gap.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/inputs/radio_list.dart';
import '../../../widgets/inputs/single_select_tags.dart';
import '../../../widgets/inputs/text_input.dart';
import '../../cashEntry/bloc/cash_entry_bloc.dart';
import '../../cashEntry/cash_entry_view_model.dart';

class CashEntryPaymentModePage extends StatelessWidget {
  const CashEntryPaymentModePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CashEntryBloc, CashEntryState>(
      listener: (_,state){

      },
      child: Background(
        isBackPressed: true,
        title: "Payment Modes",
        actions: [
          IconButton(
              onPressed: ()=>const App().setNavigation(context, AppRoutes.cashEntryPaymentModeSettings),
              icon: const Icon(Icons.settings, color: primary, size: 24),
              splashRadius: 20,
          )
        ],
        child: Stack(
          children: [
            const MainBody(),
            Positioned(
                right: 20,
                bottom: 40,
                child: FloatingActionButton.extended(
                  onPressed: ()=>onAddNewPaymentMode(context),
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


  onAddNewPaymentMode(buildContext){
    showModalBottomSheet<dynamic>(
        context: buildContext,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                topLeft:  Radius.circular(8)
            )
        ),
        builder: (context){
          return BlocProvider.value(
              value: BlocProvider.of<CashEntryBloc>(buildContext),
              child: Padding(
                padding: MediaQuery.of(context).viewInsets,
                child:Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Add New Payment Mode", style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: text
                            )),
                            IconButton(
                              onPressed: ()=>const App().setBackNavigation(context),
                              icon: const Icon(Icons.cancel),
                              splashRadius: 14,
                            )
                          ],
                        ),

                        const Divider(height: 32,),

                        TextInput(
                            controller: CashEntryViewModel.paymentModeController,
                            labelText: "Payment Mode",
                            hintText: "Enter payment mode"
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
                      ],
                    )
                ),
              ));
        }
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CashEntryViewModel viewModel = CashEntryViewModel();
    return ListView(
      padding: Dimensions.pagePadding,
      children: [
        Gap.medium1,

        const Text("Payment modes in this book",
          style: TextStyle(
              fontSize: 14,
              color: subtext,
              fontWeight: FontWeight.w600
          ),
        ),

        Gap.medium,

        RadioList(
            items: ["one","two"],
            onChanged: (val){},
            defaultItem: "No Payment Mode"
        ),

        Gap.medium1,

        const Text("Suggestions",
          style: TextStyle(
              fontSize: 14,
              color: subtext,
              fontWeight: FontWeight.w600
          ),
        ),

        Gap.medium,

        SingleSelectTags(
            tags: List.generate(viewModel.suggestedPaymentModes.length,
                    (index) => TagItem(label: viewModel.suggestedPaymentModes[index])).toList(),
            onSelected: (val){}
        )
      ],
    );
  }
}


