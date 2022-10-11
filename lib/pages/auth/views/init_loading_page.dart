import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/app.dart';
import '../../../app/app_routes.dart';
import '../../../widgets/background.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/toaster.dart';
import '../bloc/auth_bloc.dart';

class InitLoadingPage extends StatelessWidget {
  const InitLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Background(
            child: Center(
              child: BlocListener<AuthBloc,AuthState>(
                listener: (_,state){
                  if(state is GlobalDataSetSuccess){
                    const App().setNavigation(context, AppRoutes.home);
                  }else if(state is AuthFailure){
                    ScaffoldMessenger.of(context).showSnackBar(Toaster.snack(content: state.message));
                  }
                },
                child: ButtonWL(
                    isLoading: true,
                    onPressed: (){},
                    label: "Continue"
                ),
              ),
            )
        ),
        onWillPop: ()async{
          return false;
        },
    );
  }
}
