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

class LoginPasswordPage extends StatelessWidget {
  const LoginPasswordPage({Key? key}) : super(key: key);

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

    AuthViewModel viewModel = AuthViewModel();

    return SingleChildScrollView(
      padding: Dimensions.padding_20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Login", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28, color: primary)),
          const Text("Lorem ipsum dolor sit amet, consectetur.",
              style: TextStyle(color: promptColor, fontWeight: FontWeight.w500)),

          Gap.big,

          ValueListenableBuilder(
              valueListenable: viewModel.passwordViewState,
              builder: (_,__,___){
                return TextInput(
                    isPasswordField: true,
                    controller: AuthViewModel.passwordController,
                    labelText: "Password",
                    obscureText: viewModel.passwordViewState.value,
                    suffixIconClick:
                        () => viewModel.passwordViewState.value=!viewModel.passwordViewState.value,
                    hintText: "Enter password");
              }
          ),

          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: ()=>const App().setNavigation(context, AppRoutes.forgotPassword),
                  child: const Text("Forgot password ?", style: TextStyle(color: primary)))),

          Gap.big_50,

          Align(
            alignment: Alignment.center,
            child: BlocBuilder<AuthBloc, AuthState>(
                builder: (_, state){
                  return ButtonWL(
                      isLoading: state is AuthLoading,
                      onPressed: ()=>context.read<AuthBloc>().add(LoginEvent(
                          email: AuthViewModel.emailController.text,
                          password: AuthViewModel.passwordController.text
                      )),
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

