import 'package:dotted_border/dotted_border.dart';
import 'package:expense_manager/pages/cashbook/bloc/cashbook_bloc.dart';
import 'package:expense_manager/pages/cashbook/cashbook_view_model.dart';
import 'package:expense_manager/pages/cashbook/widgets/user_card.dart';
import 'package:expense_manager/utils/constants.dart';
import 'package:expense_manager/utils/gap.dart';
import 'package:expense_manager/widgets/background.dart';
import 'package:expense_manager/widgets/inputs/single_select_tags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/app.dart';
import '../../../app/app_routes.dart';
import '../../../utils/dimension_utils.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/toaster.dart';

CashbookViewModel viewModel = CashbookViewModel();

class InviteCreatePage extends StatelessWidget {
  const InviteCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
        isBackPressed: true,
        title: "Add Member",
        child: BlocListener<CashbookBloc, CashbookState>(
            listener: (_,state){
              if(state is MemberAdded){
                CashbookViewModel.clearValues();
                const App().setNavigation(context, AppRoutes.cashbook);
              }else if(state is Failure){
                ScaffoldMessenger.of(context).showSnackBar(Toaster.snack(content: state.message));
              }
            },
            child: Column(
              children: [
                const Expanded(child: MainBody()),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: border))
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: BlocBuilder<CashbookBloc, CashbookState>(
                      builder: (_,state){
                        return ButtonWL(
                          isLoading: state is Loading,
                          widthChangeOnLoad: false,
                          onPressed: ()=>context.read<CashbookBloc>().add(
                              AddMember(
                                  phone: CashbookViewModel.memberEmailController.text,
                                  role: MemberRole.values[viewModel.memberRoleType.value].name,
                                  cashbookId: CashbookViewModel.cashbook!.id
                              )
                          ),
                          label: "Add Member",
                          width: double.infinity,
                          isBlunt: true,
                        );
                      }),
                )
              ])
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
            UserCard(
                title: CashbookViewModel.memberEmailController.text,
                subTitle: 'You invite this user to this Cashbook.'
            ),

            Gap.big,

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: border),
                borderRadius: BorderRadius.circular(blunt)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Choose Role", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: text
                  )),

                  const Divider(height: 32,),

                  SingleSelectTags(
                    tags: MemberRole.values.map(
                            (e) => TagItem(label: e.name)).toList(),
                    onSelected: (val)=>viewModel.memberRoleType.value = val,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                  ),

                  Gap.medium,

                  ValueListenableBuilder(
                    valueListenable: viewModel.memberRoleType,
                    builder: (_,__,___){
                      return Text("${MemberRole.values[viewModel.memberRoleType.value].name} permissions",
                          style: const TextStyle(color: info, fontWeight: FontWeight.w500)
                      );
                    },),

                  Gap.medium,

                  ValueListenableBuilder(
                    valueListenable: viewModel.memberRoleType,
                    builder: (_,__,___){
                      return Column(
                        children: [
                          ...CashbookViewModel.permissions[viewModel.memberRoleType.value].map(
                                  (e) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 6),
                                child: Row(
                                  children: [
                                    const Icon(Icons.check_circle, color: Colors.green, size: 18,),
                                    const SizedBox(width: 10,),
                                    Flexible(child: Text(
                                        e, style: const TextStyle(
                                        color: text130,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500
                                    )))
                                  ],
                                ),
                              )
                          ).toList()
                        ],
                      );
                    },),
                ],
              ),
            ),

            Gap.medium,

          DottedBorder(
              padding: const EdgeInsets.all(12),
              color: information,
              child: const SizedBox(
                width: double.infinity,
                child: Text("You can change this role later",
                  style: TextStyle(
                      color: information,
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                  ),
                ),
              )
          )
        ])
    );
  }
}
