import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/app.dart';
import '../../../app/app_routes.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimension_utils.dart';
import '../../../utils/gap.dart';
import '../../../widgets/background.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/inputs/text_input.dart';
import '../../../widgets/toaster.dart';
import '../auth_view_model.dart';
import '../bloc/auth_bloc.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Forgot password ?", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28, color: primary)),
          const Text("Lorem ipsum dolor sit amet, consectetur.",
              style: TextStyle(color: promptColor, fontWeight: FontWeight.w500)),

          Gap.big,

          TextInput(
              controller: AuthViewModel.emailController,
              labelText: "Email address",
              hintText: "Enter email address"),

          Gap.big_50,

          Align(
            alignment: Alignment.center,
            child: BlocBuilder<AuthBloc, AuthState>(
                builder: (_, state){
                  return ButtonWL(
                      isLoading: state is AuthLoading,
                      onPressed: ()=>context.read<AuthBloc>().add(ForgotPassword(
                          email: AuthViewModel.emailController.text)),
                      label: "Continue"
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

