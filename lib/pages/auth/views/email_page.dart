
import 'package:easy_localization/easy_localization.dart';
import 'package:expense_manager/app/app.dart';
import 'package:expense_manager/app/app_routes.dart';
import 'package:expense_manager/pages/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../utils/constants.dart';
import '../../../utils/dimension_utils.dart';
import '../../../utils/gap.dart';
import '../../../widgets/background.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/button/social_media_button.dart';
import '../../../widgets/inputs/text_input.dart';
import '../../../widgets/toaster.dart';
import '../auth_view_model.dart';

AuthViewModel viewModel = AuthViewModel();

class EmailPage extends StatelessWidget {
  const EmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async{
          const App().closeApp();
          return false;
        },
        child: Background(
            child: BlocListener<AuthBloc, AuthState>(
              listener: (_,state){
                if(state is AuthType){
                  const App().setNavigation(context, state.isLogin
                      ? AppRoutes.loginPassword
                      : AppRoutes.createPassword);
                }else if(state is AuthFailure){
                  ScaffoldMessenger.of(context).showSnackBar(Toaster.snack(content: state.message));
                }
              },
              child: const MainBody(),
            )
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
        children: [
          ShaderMask(
              shaderCallback: (bounds)=>splashGradient.createShader(bounds),
              blendMode: BlendMode.srcIn,
              child: const Text("SPLIT FREE", style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 28))),

          Text("Spent - Split - Pay",style: Theme.of(context).primaryTextTheme.bodyText2?.copyWith(
              fontSize: 12, fontWeight: FontWeight.w500)).tr(),

          Gap.big_35,

          TextInput(
              controller: AuthViewModel.emailController,
              labelText: "Email address",
              hintText: "Enter email address"),

          Gap.big_50,

          BlocBuilder<AuthBloc, AuthState>(
              builder: (_, state){
                return ButtonWL(
                    isLoading: state is AuthLoading,
                    onPressed: ()=>context.read<AuthBloc>().add(
                        CheckIfLoginOrSignIn(
                          email: AuthViewModel.emailController.text
                        )
                    ),
                    label: "Continue"
                );
              }),

          Gap.big,

          const Text("OR", style: TextStyle(color: info, fontWeight: FontWeight.w500)),

          Gap.big,
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SocialMediaButton(label: "Google",type: SocialMediaType.google, onPressed: (){}),
              SocialMediaButton(label: "Facebook",type: SocialMediaType.facebook, onPressed: (){})
            ],
          ),

          Gap.big_50,

          SizedBox(
            width: Dimensions.getScreenSize(context).width*0.75,
            child: const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                textAlign: TextAlign.center,
                style: TextStyle(color: info, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}

