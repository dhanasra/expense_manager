import 'package:expense_manager/widgets/utils/gap.dart';
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
import '../auth_view_model.dart';
import '../bloc/auth_bloc.dart';

AuthViewModel viewModel = AuthViewModel();
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

    return SingleChildScrollView(
      padding: Dimensions.padding_20,
      child: Form(
        key: viewModel.formGlobalKey,
        child: Column(
        children: [

          const Align(
            alignment: Alignment.centerLeft,
            child: Text("Login", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28, color: secondary)),
          ),

          const Align(
            alignment: Alignment.centerLeft,
            child: Text("Manage All Your Cash With Roova Book.",
              style: TextStyle(color: text, fontWeight: FontWeight.w500, fontSize: 10)),
          ),

          Gap.large,

          ValueListenableBuilder(
              valueListenable: viewModel.passwordViewState,
              builder: (_,__,___){
                return TextInput(
                    isPasswordField: true,
                    controller: AuthViewModel.passwordController,
                    labelText: "Password",
                    autoFocus: true,
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

          const Gap(size: 50,),

          BlocBuilder<AuthBloc, AuthState>(
                builder: (_, state){
                  return ButtonWL(
                      isLoading: state is AuthLoading,
                      onPressed: (){
                        if (viewModel.formGlobalKey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();                          
                          context.read<AuthBloc>().add(LoginEvent(
                                email: AuthViewModel.emailController.text,
                                password: AuthViewModel.passwordController.text
                            ));
                        }
                      },
                      label: "CONTINUE"
                  );
                })
        ],
      )),
    );
  }
}

