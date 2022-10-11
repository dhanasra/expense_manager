import 'package:expense_manager/app/app.dart';
import 'package:expense_manager/app/app_routes.dart';
import 'package:expense_manager/pages/splash/bloc/splash_bloc.dart';
import 'package:expense_manager/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
        child: BlocListener<SplashBloc, SplashState>(
          listener: (_,state){
            const App().setNavigation(context, state is Login
                ? AppRoutes.welcome
                : state is Profile
                ? AppRoutes.profile
                : AppRoutes.home);
          },
          child: Container(
            decoration: const BoxDecoration(gradient: splashGradient),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("${appAssets}app_icon.png", width: 80, height: 80)
                ],
              ),
            ),
          ),
        )
    );
  }
}

