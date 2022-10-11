import 'package:currency_picker/currency_picker.dart';
import 'package:expense_manager/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/app.dart';
import '../../../app/app_routes.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimension_utils.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/inputs/languages_drop_down.dart';
import '../../../widgets/inputs/text_input.dart';
import '../../../widgets/toaster.dart';
import '../../../widgets/utils/gap.dart';
import '../auth_view_model.dart';
import '../bloc/auth_bloc.dart';

AuthViewModel viewModel = AuthViewModel();
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
      child: Form(
        key: viewModel.formGlobalKey,
        child: Column(
        children: [

          const Align(
            alignment: Alignment.centerLeft,
            child: Text("Active your profile", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28, color: secondary)),
          ),

          const Align(
            alignment: Alignment.centerLeft,
            child: Text("Manage All Your Cash With Roova Book.",
              style: TextStyle(color: text, fontWeight: FontWeight.w500, fontSize: 10)),
          ),

          Gap.large,

          TextInput(
              controller: AuthViewModel.firstNameController,
              labelText: "First name",
              autoFocus: true,
              hintText: "Enter first name"),

          const Gap(size: 20,),

          TextInput(
              controller: AuthViewModel.lastNameController,
              labelText: "Last name",
              hintText: "Enter last name"),

          const Gap(size: 20,),

          TextInput(
              controller: AuthViewModel.phoneNumberController,
              labelText: "Mobile number",
              inputType: TextInputType.phone,
              hintText: "Enter mobile number"),

          const Gap(size: 50,),

          BlocBuilder<AuthBloc, AuthState>(
                builder: (_, state){
                  return ButtonWL(
                      isLoading: state is AuthLoading,
                      onPressed: (){
                         if (viewModel.formGlobalKey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();                          
                          context.read<AuthBloc>().add(CreateUser(
                            email: AuthViewModel.emailController.text,
                            firstName: AuthViewModel.firstNameController.text,
                            lastName: AuthViewModel.lastNameController.text,
                            mobileNumber: AuthViewModel.phoneNumberController.text,
                            defaultCurrency: AuthViewModel.defaultCurrency,
                            locale: AuthViewModel.language,
                          ));
                        }
                      },
                      label: "CREATE"
                  );
                })
        ],
      )),
    );
  }
}
