import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/app.dart';
import '../../../app/app_routes.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimension_utils.dart';
import '../../../widgets/background.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/inputs/text_input.dart';
import '../../../widgets/toaster.dart';
import '../../../widgets/utils/gap.dart';
import '../auth_view_model.dart';
import '../bloc/auth_bloc.dart';

AuthViewModel viewModel = AuthViewModel();
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
        isBackPressed: true,
        child: BlocListener<AuthBloc, AuthState>(
            listener: (_,state){
              if(state is ResetLinkSent){
                const App().setNavigation(context, AppRoutes.loginPassword);
              }else if(state is AuthFailure){
                ScaffoldMessenger.of(context).showSnackBar(Toaster.snack(content: state.message));
              }
            },
            child: const MainBody()
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
            child: Text("Forgot password ?", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28, color: secondary)),
          ),

          const Align(
            alignment: Alignment.centerLeft,
            child: Text("Manage All Your Cash With Roova Book.",
              style: TextStyle(color: text, fontWeight: FontWeight.w500, fontSize: 10)),
          ),

          Gap.large,

          TextInput(
              controller: AuthViewModel.emailController,
              labelText: "Email address",
              hintText: "Enter email address"),

          const Gap(size: 50,),

          BlocBuilder<AuthBloc, AuthState>(
                builder: (_, state){
                  return ButtonWL(
                      isLoading: state is AuthLoading,
                      onPressed: (){
                        if (viewModel.formGlobalKey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();                          
                          context.read<AuthBloc>().add(ForgotPassword(
                          email: AuthViewModel.emailController.text));
                        }
                      },
                      label: "Continue"
                  );
                })
        ],
      )),
    );
  }
}

