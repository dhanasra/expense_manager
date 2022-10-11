import 'package:expense_manager/app/app.dart';
import 'package:expense_manager/app/app_routes.dart';
import 'package:expense_manager/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:expense_manager/pages/dashboard/views/dashboard_page.dart';
import 'package:expense_manager/utils/constants.dart';
import 'package:expense_manager/widgets/background.dart';
import 'package:expense_manager/widgets/containers/box.dart';
import 'package:expense_manager/widgets/text/get_text.dart';
import 'package:expense_manager/widgets/utils/custom_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../cubit/home_cubit.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<Widget> children = [
      BlocProvider(
          create: (_)=>DashboardBloc()..add(GetCashbooks()),
          child: const DashboardPage()),
      Background(child: Container()),
      Background(child: Container()),
      Background(child: Container()),
      Background(child: Container())
    ];

    return WillPopScope(
        onWillPop: () async {
          const App().closeApp();
          return true;
        },
        child: BlocBuilder<HomeCubit,int>(
          builder: (_,state){
            return Scaffold(
                body: children[state],
                bottomNavigationBar: Stack(
                  alignment: Alignment.center,
                  children: [
                    Box(
                      height: 60,
                      margin: const EdgeInsets.symmetric(horizontal:20, vertical: 10),
                      borderRadius: 16,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child:BottomNavigationBar(
                          items: const [
                            BottomNavigationBarItem(
                                icon: Icon(FontAwesomeIcons.house),
                                label: ''),
                            BottomNavigationBarItem(
                                icon: Icon(FontAwesomeIcons.userGroup),
                                label: ''),
                            BottomNavigationBarItem(
                                icon: SizedBox(),
                                label: ''),
                            BottomNavigationBarItem(
                                icon: Icon(FontAwesomeIcons.chartSimple),
                                label: ''),
                            BottomNavigationBarItem(
                                icon: Icon(FontAwesomeIcons.gear),
                                label: ''),
                          ],
                          showSelectedLabels: false,
                          showUnselectedLabels: false,
                          currentIndex: state,
                          onTap: (index){
                            if(index!=2) {
                              BlocProvider.of<HomeCubit>(context).currentPageIndex(index);
                            }
                          },
                        ),
                      )
                    ),
                    Positioned(
                        bottom: 20,
                        child: FloatingActionButton(
                            child: const Icon(
                              FontAwesomeIcons.plus,
                              size: 32,
                              color: Colors.white,),
                            onPressed: ()=>showAddBottomSheet(context)
                        )
                    )
                  ],
                )
            );
          },
        )
    );
  }

  showAddBottomSheet(BuildContext context){
    CustomBottomSheet.showCustomBottomSheet(
        buildContext: context,
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 300
          ),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1
              ),
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (_,index){
                return GestureDetector(
                  onTap: (){
                    const App().setBackNavigation(context);
                    const App().setNavigation(context, AppRoutes.cashbookCreate);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        backgroundColor: bgLight,
                        child: Icon(Icons.book, color: primary,),
                      ),
                      const SizedBox(height: 6,),
                      GetText.subTitleSmall("Cash Book",
                          align: TextAlign.center,
                          type: TextType.mini
                      )
                    ],
                  ),
                );
              }
          ),
        )
    );
  }
}
