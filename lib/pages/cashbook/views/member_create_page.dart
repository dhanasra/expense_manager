import 'package:expense_manager/app/app.dart';
import 'package:expense_manager/app/app_routes.dart';
import 'package:expense_manager/utils/constants.dart';
import 'package:expense_manager/utils/gap.dart';
import 'package:expense_manager/widgets/background.dart';
import 'package:expense_manager/widgets/button/contact_button.dart';
import 'package:expense_manager/widgets/toaster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/dimension_utils.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/inputs/text_input.dart';
import '../bloc/cashbook_bloc.dart';
import '../cashbook_view_model.dart';

class MemberCreatePage extends StatelessWidget {
  const MemberCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
        isBackPressed: true,
        title: "Add Member",
        child: BlocListener<CashbookBloc, CashbookState>(
          listener: (_,state){

          },
          child: const MainBody(),
        ));
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
           ContactButton(
               onPressed: ()=>const App().setNavigation(context, AppRoutes.memberContactCreate)
           ),

           Gap.big_35,

           Row(
             children: const [
               Expanded(child: Divider()),
               Text('OR'),
               Expanded(child: Divider()),
             ],
           ),

           Gap.big_35,

           const Text("Add using Phone number", style: TextStyle(
             fontWeight: FontWeight.w500,
             color: subText
           ),),

           Gap.medium,

           TextInput(
              controller: CashbookViewModel.memberEmailController,
              labelText: "Phone number",
              hintText: "Enter phone number",
              autoFocus: true,
              inputType: TextInputType.phone,
           ),

          Gap.big_50,

          BlocBuilder<CashbookBloc, CashbookState>(
              builder: (_,state){
                return ButtonWL(
                  isLoading: state is Loading,
                  widthChangeOnLoad: false,
                  onPressed: (){
                    if(CashbookViewModel.memberEmailController.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                          Toaster.snack(content: "Phone number is empty")
                      );
                      return;
                    }
                    const App().setNavigation(context, AppRoutes.inviteCreate);
                  },
                  label: "Add Member",
                  width: double.infinity,
                  isBlunt: true,
                );
              })

        ])
    );
  }
}
