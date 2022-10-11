import 'package:expense_manager/pages/auth/auth_view_model.dart';
import 'package:expense_manager/pages/auth/bloc/auth_bloc.dart';
import 'package:expense_manager/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../app/app.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimension_utils.dart';
import '../../../utils/gap.dart';
import '../../../widgets/button/button.dart';

AuthViewModel viewModel = AuthViewModel();

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
        isBackPressed: true,
        child: BlocListener<AuthBloc, AuthState>(
          listener: (_,state){

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
          const Text("Otp", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28, color: primary)),
          const Text("Lorem ipsum dolor sit amet, consectetur.",
              style: TextStyle(color: promptColor, fontWeight: FontWeight.w500)),

          Gap.big,

          Pinput(
            length: 6,
            defaultPinTheme: viewModel.defaultPinTheme,
            focusedPinTheme: viewModel.focusedPinTheme,
            submittedPinTheme: viewModel.submittedPinTheme,
          ),

          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: (){},
                  child: const Text("Resend", style: TextStyle(color: primary)))),

          Gap.big_50,

          Align(
            alignment: Alignment.center,
            child: BlocBuilder<AuthBloc, AuthState>(
                builder: (_, state){
                  return ButtonWL(
                      isLoading: state is AuthLoading,
                      onPressed: ()=>{},
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
