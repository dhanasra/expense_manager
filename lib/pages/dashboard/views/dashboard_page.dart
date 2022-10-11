import 'package:expense_manager/app/app.dart';
import 'package:expense_manager/app/app_routes.dart';
import 'package:expense_manager/pages/cashbook/bloc/cashbook_bloc.dart';
import 'package:expense_manager/pages/cashbook/cashbook_view_model.dart';
import 'package:expense_manager/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:expense_manager/pages/dashboard/dashboard_view_model.dart';
import 'package:expense_manager/pages/dashboard/widgets/cashbook_item.dart';
import 'package:expense_manager/pages/dashboard/widgets/empty_item.dart';
import 'package:expense_manager/pages/dashboard/widgets/top_bar.dart';
import 'package:expense_manager/utils/constants.dart';
import 'package:expense_manager/utils/dimension_utils.dart';
import 'package:expense_manager/utils/globals.dart';
import 'package:expense_manager/widgets/background.dart';
import 'package:expense_manager/widgets/button/button.dart';
import 'package:expense_manager/widgets/containers/box.dart';
import 'package:expense_manager/widgets/inputs/radio_list.dart';
import 'package:expense_manager/widgets/inputs/search_input.dart';
import 'package:expense_manager/widgets/loader.dart';
import 'package:expense_manager/widgets/text/get_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../db/model/cashbook.dart';
import '../../../utils/gap.dart';
import '../../../widgets/inputs/text_input.dart';
import '../../../widgets/utils/custom_bottom_sheet.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
        child: BlocListener<DashboardBloc, DashboardState>(
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
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      children: [
        TopBar(
            name: Globals.name
        ),

        DefaultTabController(
            length: 2,
            child: Box(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TabBar(
                      tabs: [
                        Tab(text: "Cashbooks"),
                        Tab(text: "Budgets")
                      ],
                      labelColor: primary,
                      unselectedLabelColor: promptColor,
                      indicatorColor: promptColor,
                      indicatorWeight: 4,
                      labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    SizedBox(
                      height: Dimensions.getScreenSize(context).height-300,
                      child: TabBarView(
                      children: [
                        BlocBuilder<DashboardBloc, DashboardState>(
                          buildWhen: (_,state)=>state is CashbooksFetched || state is BookDeleted || state is BookRenamed || state is CashbooksLoading ,
                          builder: (_,state){
                            if(state is CashbooksFetched){
                              return CashbooksBuilder(cashbooks: state.cashbooks, isLoading: false,);
                            }else if(state is BookDeleted){
                              return CashbooksBuilder(cashbooks: state.cashbooks, isLoading: false,);
                            }else if(state is BookRenamed){
                              return CashbooksBuilder(cashbooks: state.cashbooks, isLoading: false,);
                            }else if(state is CashbooksLoading){
                              return const CashbooksBuilder(isLoading: true);
                            }else{
                              return const SizedBox.shrink();
                            }
                          }
                        ),
                        const CashbooksBuilder(cashbooks: [],isLoading: false,),
                      ]),
                    )
                  ],
                )
            )
        )
      ],
    );
  }
}

class CashbooksBuilder extends StatelessWidget {
  final List<Cashbook>? cashbooks;
  final bool isLoading;
  const CashbooksBuilder({
    Key? key,
    required this.isLoading,
    this.cashbooks
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: isLoading ? 3 : cashbooks!.isEmpty ? 1 : cashbooks!.length+1,
            shrinkWrap: true,
            itemBuilder: (_,index){
              return isLoading 
                ? const Padding(
                    padding: EdgeInsets.all(10),
                    child: Loader(type: shimmer_1) ,
                  )
                : cashbooks!.isEmpty
                ? EmptyItem(
                    onClick: (){},
                    title: "Add New Cashbook",
                    btnText: "Create New Book",
                    subtitle: "You have no cashbooks. To record expenses create a cashbook."
                )
                : index==0 
                ? SearchInput(
                    onChanged: (val){
                      context.read<DashboardBloc>().add(
                          SearchCashBook(cashbooks: cashbooks!, text: val.toString()
                          )
                      );
                    },
                    onSortClick: ()=>showCashbookFilter(context),
                )
                : CashbookItem(
                    cashbook: cashbooks![index-1],
                    onClick: (){
                      CashbookViewModel.cashbook = cashbooks![index-1];
                      const App().setNavigation(context, AppRoutes.cashbook);
                    },
                    renameClick: (){
                      DashboardViewModel.renameController.text
                        =  DashboardViewModel.selectedCashbook!.name;
                      renameCashbook(context, cashbooks![index-1].id, index, cashbooks!);
                    },
                    deleteClick: (){
                      deleteCashbook(context, index, cashbooks![index-1], cashbooks!);
                    },
              );
            },
            separatorBuilder: (_,index){
              return const Divider();  
            }
        );
  }

  void showCashbookFilter(buildContext){
    CustomBottomSheet.showCustomBottomSheetWithBloc(
      buildContext: buildContext,
      child: (context){
        return BlocProvider.value(
          value: BlocProvider.of<DashboardBloc>(buildContext),
          child: CustomBottomSheet.bottomSheetChild(
              context: context,
              title: "Sort Books By",
              children: [
                RadioList(
                    items: const [
                      "Last Updated",
                      "Name (A to Z)",
                      "Net Balance (High to Low)",
                      "Net Balance (Low to High)",
                      "Net Balance (Last Created)"
                    ],
                    selectedValue: "Last Updated",
                    onChanged: (val){},
                ),
                Gap.big_35,
                BlocBuilder<DashboardBloc, DashboardState>(
                    builder: (context,state){
                      return ButtonWL(
                        isLoading: state is Loading,
                        widthChangeOnLoad: false,
                        onPressed: (){

                        },
                        label: "APPLY",
                        width: double.infinity,
                        isBlunt: true,
                      );
                    }
                )
              ]
          ),
        );
      },
    );
  }


  void deleteCashbook(buildContext, index, Cashbook cashbook, List<Cashbook> cashbooks){
    GlobalKey<FormState> formGlobalKey = GlobalKey <FormState> ();
    CustomBottomSheet.showCustomBottomSheetWithBloc(
      buildContext: buildContext,
      child: (context){
        return Form(
          key: formGlobalKey,
          child: BlocProvider.value(
            value: BlocProvider.of<DashboardBloc>(buildContext),
            child: CustomBottomSheet.bottomSheetChild(
                    context: context,
                    title: "Delete Cashbook",
                    onClose: ()=>DashboardViewModel.deleteController.clear(),
                    children: [
                      Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: error.withOpacity(0.1)
                          ),
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              const Icon(Icons.info, color: error,),
                              const SizedBox(width: 10,),
                              Flexible(
                                  child: GetText.subTitleSmall(
                                      "Are you sure ? You will lose all entries of this book permanently",
                                      type: TextType.mini,
                                      color: error
                                  )
                              )
                            ],
                          )
                      ),
                      Row(
                        children: [
                          GetText.subTitleSmall("Please type  ", type: TextType.mini),
                          GetText.subTitleSmall(cashbook.name, color: text),
                          GetText.subTitleSmall("  to confirm", type: TextType.mini)
                        ],
                      ),
                      Gap.medium1,
                      TextInput(
                        controller: DashboardViewModel.deleteController,
                        labelText: "Book Name",
                        hintText: "Enter Book Name",
                        validateText: cashbook.name,
                      ),
                      Gap.big_35,
                      BlocConsumer<DashboardBloc, DashboardState>(
                        listener: (_,state){
                            if(state is BookDeleted){
                                DashboardViewModel.deleteController.clear();
                                const App().setBackNavigation(context);
                              }
                            },
                          builder: (context,state){
                            return ButtonWL(
                              isLoading: state is CashbooksDeleting,
                              widthChangeOnLoad: false,
                              onPressed: (){
                                if(formGlobalKey.currentState!.validate()){
                                  FocusScope.of(context).unfocus();
                                  context.read<DashboardBloc>().add(
                                      DeleteCashbook(
                                          index: index,
                                          cashbooks: cashbooks,
                                          id: cashbook.id
                                      )
                                  );
                                }
                              },
                              label: "DELETE",
                              width: double.infinity,
                              isBlunt: true,
                            );
                          }
                      )
                    ]
                ),
          ),
        );
      },
    );
  }

  void renameCashbook(buildContext, id, index, cashbooks){
    GlobalKey<FormState> formGlobalKey = GlobalKey <FormState> ();
    CustomBottomSheet.showCustomBottomSheetWithBloc(
      buildContext: buildContext,
      child: (context){
        return Form(
            key: formGlobalKey,
            child: BlocProvider.value(
          value: BlocProvider.of<DashboardBloc>(buildContext),
          child: CustomBottomSheet.bottomSheetChild(
              context: context,
              title: "Rename Cashbook",
              onClose: ()=>DashboardViewModel.renameController.clear(),
              children: [
                TextInput(
                    controller: DashboardViewModel.renameController,
                    labelText: "Book Name",
                    hintText: "Enter Book Name"
                ),
                Gap.big_35,

                BlocConsumer<DashboardBloc, DashboardState>(
                    listener: (_,state){
                      if(state is BookRenamed){
                        DashboardViewModel.renameController.clear();
                        const App().setBackNavigation(context);
                      }
                    },
                    builder: (context,state){
                      return ButtonWL(
                        isLoading: state is CashbooksRenaming,
                        widthChangeOnLoad: false,
                        onPressed: (){
                          if(formGlobalKey.currentState!.validate()){
                            FocusScope.of(context).unfocus();
                            context.read<DashboardBloc>().add(
                                RenameCashbook(
                                    index: index,
                                    cashbooks: cashbooks,
                                    id: id,
                                    name: DashboardViewModel.renameController.text
                                )
                            );
                          }
                        },
                        label: "Save",
                        width: double.infinity,
                        isBlunt: true,
                      );
                    }
                )
              ]
          ),
        ));
      },
    );
  }
}