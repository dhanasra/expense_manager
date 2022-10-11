import 'package:currency_picker/currency_picker.dart';
import 'package:expense_manager/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/app.dart';
import '../../../app/app_routes.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimension_utils.dart';
import '../../../utils/gap.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/inputs/languages_drop_down.dart';
import '../../../widgets/inputs/text_input.dart';
import '../../../widgets/toaster.dart';
import '../auth_view_model.dart';
import '../bloc/auth_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
        isBackPressed: true,
        child: BlocListener<AuthBloc, AuthState>(
          listener: (_,state){
            if(state is AuthSuccess){
              const App().setNavigation(context, AppRoutes.initLoading);
            }else if(state is AuthFailure){
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
    return SingleChildScrollView(
      padding: Dimensions.padding_20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Active your profile", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28, color: primary)),
          const Text("Lorem ipsum dolor sit amet, consectetur.",
              style: TextStyle(color: promptColor, fontWeight: FontWeight.w500)),

          Gap.big,

          TextInput(
              controller: AuthViewModel.firstNameController,
              labelText: "First name",
              hintText: "Enter first name"),

          Gap.normal,

          TextInput(
              controller: AuthViewModel.lastNameController,
              labelText: "Last name",
              hintText: "Enter last name"),

          Gap.normal,

          Row(
            children: [
              Expanded(child: CurrencyPicker(
                onChanged: (currency)=>AuthViewModel.defaultCurrency = currency,
              )),
              const SizedBox(width: 20,),
              Expanded(child: LanguagesDropDown(
                onChanged: (language)=>AuthViewModel.language = language,
              ))
            ],
          ),

          Gap.big_50,

          Align(
            alignment: Alignment.center,
            child: BlocBuilder<AuthBloc, AuthState>(
                builder: (_, state){
                  return ButtonWL(
                      isLoading: state is AuthLoading,
                      onPressed: ()=>context.read<AuthBloc>().add(InitAccount(
                        firstName: AuthViewModel.firstNameController.text,
                        lastName: AuthViewModel.lastNameController.text,
                        defaultCurrency: AuthViewModel.defaultCurrency,
                        locale: AuthViewModel.language,
                      )),
                      label: "Create"
                  );
                }),
          ),

          Gap.big_50,

          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: Dimensions.getScreenSize(context).width*0.75,
              child: const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: info, fontWeight: FontWeight.w500)),
            ),
          ),
        ],
      ),
    );
  }
}
