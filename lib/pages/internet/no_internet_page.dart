import 'package:expense_manager/pages/internet/bloc/internet_bloc.dart';
import 'package:expense_manager/utils/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/constants.dart';
import '../../widgets/background.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
        child: BlocListener<InternetBloc, InternetState>(
          listener: (_,state){

          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(FontAwesomeIcons.wifi, size: 30,),
                Gap.medium,
                const Text("Internet is disconnected.", style: TextStyle(color: info, fontWeight: FontWeight.w500)),
                Gap.big,
                ElevatedButton(
                    onPressed: (){},
                    child: const Text("Refresh")
                )
              ],
            ),
          ),
        )
    );
  }
}
