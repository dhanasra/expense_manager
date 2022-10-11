import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../../../app/app_routes.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimension_utils.dart';
import '../../../widgets/background.dart';
import '../../../widgets/carousel.dart';
import '../auth_view_model.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
        child: MainBody()
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AuthViewModel viewModel = AuthViewModel();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 8,
            child: Stack(
              children: [
                Carousel(
                  controller: viewModel.controller,
                  onPageChanged: (page)=>viewModel.carouselState.value = page,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(child: const Text("Skip"),onPressed: ()=>
                      const App().setNavigation(context, AppRoutes.email)),
                )
              ],
            )
        ),
        Expanded(
            flex: 1,
            child: Container(
              padding: Dimensions.pagePadding,
              margin: const EdgeInsets.only(bottom: 20),
              child: ValueListenableBuilder(
                  valueListenable: viewModel.carouselState,
                  builder: (_,__,___){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Indicator(currentPage: viewModel.carouselState.value),
                        ElevatedButton(
                            onPressed: (){
                              if(viewModel.carouselState.value==2){
                                const App().setNavigation(context, AppRoutes.email);
                              }else{
                                viewModel.carouselState.value = viewModel.carouselState.value+1;
                                viewModel.controller.animateToPage(
                                    viewModel.carouselState.value,
                                    duration: kMS500,
                                    curve: Curves.easeIn);
                              }
                            },
                            child: Text(viewModel.carouselState.value==2 ? "Start" : "Next"))
                      ],
                    );
                  }
              )
            )
        ),
      ],
    );
  }
}

class Indicator extends StatelessWidget {
  final int currentPage;
  const Indicator({Key? key, required this.currentPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(3, (index) =>
            AnimatedContainer(
                duration: kMS500,
                width: index==currentPage ? 30 : 14,
                height: 14,
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(circle)
                )
            )),
      ),
    );
  }
}

