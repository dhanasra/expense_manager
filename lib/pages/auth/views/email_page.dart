import 'package:easy_localization/easy_localization.dart';
import 'package:expense_manager/app/app.dart';
import 'package:expense_manager/app/app_routes.dart';
import 'package:expense_manager/pages/auth/bloc/auth_bloc.dart';
import 'package:expense_manager/widgets/utils/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimension_utils.dart';
import '../../../widgets/background.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/inputs/text_input.dart';
import '../../../widgets/toaster.dart';
import '../auth_view_model.dart';

AuthViewModel viewModel = AuthViewModel();

class EmailPage extends StatelessWidget {
  const EmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          const App().closeApp();
          return false;
        },
        child: Background(
            child: BlocListener<AuthBloc, AuthState>(
          listener: (_, state) {
            if (state is AuthType) {
              const App().setNavigation(
                  context,
                  state.isLogin
                      ? AppRoutes.loginPassword
                      : AppRoutes.createPassword);
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(Toaster.snack(content: state.message));
            }
          },
          child: const MainBody(),
        )));
  }
}

class MainBody extends StatelessWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Form(
            key: viewModel.formGlobalKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: Column(
              children: [
                ShaderMask(
                    shaderCallback: (bounds) =>
                        splashGradient.createShader(bounds),
                    blendMode: BlendMode.srcIn,
                    child: const Text("Roova  Book",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 28))),
                
                const Text("Manage cash in a correct way",
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500)).tr(),
                
                const Gap(size: 20,),

                Image.asset("${appAssets}app_logo_1.png", width: 70,),

                const Gap(size: 60,),
                
                TextInput(
                    controller: AuthViewModel.emailController,
                    labelText: "Email address",
                    autoFocus: true,
                    hintText: "Enter email address"),
                
               const Gap(size: 50,),

                BlocBuilder<AuthBloc, AuthState>(builder: (_, state) {
                  return ButtonWL(
                      isLoading: state is AuthLoading,
                      onPressed: () {
                        if (viewModel.formGlobalKey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();
                          context.read<AuthBloc>().add(CheckIfLoginOrSignIn(
                              email: AuthViewModel.emailController.text));
                        }
                      },
                      width: 200,
                      label: "CONTINUE");
                })
              ],
            )),
            );
  }
}
