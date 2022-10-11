import 'package:contacts_service/contacts_service.dart';
import 'package:expense_manager/app/app.dart';
import 'package:expense_manager/app/app_routes.dart';
import 'package:expense_manager/bloc/contacts_bloc/contacts_bloc.dart';
import 'package:expense_manager/pages/cashbook/widgets/phone_card.dart';
import 'package:expense_manager/utils/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants.dart';
import '../../../widgets/background.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/inputs/single_select_tags.dart';
import '../bloc/cashbook_bloc.dart';
import '../cashbook_view_model.dart';


CashbookViewModel viewModel = CashbookViewModel();

class MemberContactPage extends StatelessWidget {
  const MemberContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
        isBackPressed: true,
        actions: [
          GestureDetector(
            onTap: (){
              CashbookViewModel.clearValues();
              const App().setNavigation(context, AppRoutes.cashbook);
            },
            child: const Center(
              child: Padding(
                padding: EdgeInsets.only(right: 15, left: 10),
                child: Text("Done", style: TextStyle(
                    color: primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 16
                )),
              ),
            ),
          )
        ],
        title: CashbookViewModel.cashbook?.name??"",
        child: BlocListener<CashbookBloc, CashbookState>(
          listener: (_,state){
            if(state is MemberAdded){
              const App().setBackNavigation(context);
              viewModel.addedContacts.add(CashbookViewModel.memberEmailController.text);
              context.read<ContactsBloc>().add(AddContacts());
            }
          },
          child: BlocBuilder<ContactsBloc, ContactsState>(
            builder: (_,state){
              if(state is ContactsLoading){
                return Center(
                  child: ButtonWL(
                      isLoading: true,
                      onPressed: (){},
                      label: "Continue"
                  ),
                );
              }else if(state is ContactsFetched || state is ContactAdded){
                if(state is ContactsFetched){
                  viewModel.contacts = state.contacts;
                }

                return MainBody(
                    contacts: state is ContactsFetched
                        ? state.contacts
                        : viewModel.contacts);
              }else if(state is ContactPermissionDenied){
                return Center(
                  child: ButtonWL(
                      isLoading: state is ContactsLoading,
                      onPressed: ()=>context.read<ContactsBloc>().add(GetContacts()),
                      label: "Allow Contacts Permission"
                  ),
                );
              }else{
                return const SizedBox.shrink();
              }
            },
          ),
        )
    );
  }
}

class MainBody extends StatelessWidget {
  final List<Contact> contacts;
  const MainBody({
    Key? key,
    required this.contacts
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.separated(
                itemCount: contacts.length,
                itemBuilder: (_,index){
                  String phone = contacts[index].phones!=null && contacts[index].phones!.isNotEmpty
                      ? contacts[index].phones![0].value??""
                      : "";
                  return PhoneCard(
                      avatar: null,
                      title: contacts[index].displayName??"",
                      subTitle: phone,
                      isAdded: viewModel.addedContacts.contains(phone),
                      onAdd: (){
                        CashbookViewModel.memberEmailController.text = phone;
                        showBottomSheet(context);
                      },
                  );
                },
                separatorBuilder: (_,index){
                  return const Divider();
                },
            ))
      ],
    );
  }

  showBottomSheet(buildContext){
    showModalBottomSheet(
        context: buildContext,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8),
              topLeft:  Radius.circular(8)
          )
        ),
        builder: (context){
          return BlocProvider.value(
              value: BlocProvider.of<CashbookBloc>(buildContext),
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Choose Role", style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: text
                          )),
                          IconButton(
                            onPressed: ()=>const App().setBackNavigation(context),
                            icon: const Icon(Icons.cancel),
                            splashRadius: 14,
                          )
                        ],
                      ),

                      const Divider(height: 32,),

                      SingleSelectTags(
                        tags: MemberRole.values.map(
                                (e) => TagItem(label: e.name)).toList(),
                        onSelected: (val)=>viewModel.memberRoleType.value = val,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                      ),

                      Expanded(child: ListView(children: [
                        ValueListenableBuilder(
                          valueListenable: viewModel.memberRoleType,
                          builder: (_,__,___){
                            return Text("${MemberRole.values[viewModel.memberRoleType.value].name} permissions",
                                style: const TextStyle(color: info, fontWeight: FontWeight.w500)
                            );
                          },),

                        Gap.medium,

                        ValueListenableBuilder(
                          valueListenable: viewModel.memberRoleType,
                          builder: (_,__,___){
                            return Column(
                              children: [
                                ...CashbookViewModel.permissions[viewModel.memberRoleType.value].map(
                                        (e) => Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 6),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.check_circle, color: Colors.green, size: 18,),
                                          const SizedBox(width: 10,),
                                          Flexible(child: Text(
                                              e, style: const TextStyle(
                                              color: text130,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500
                                          )))
                                        ],
                                      ),
                                    )
                                ).toList()
                              ],
                            );
                          },),
                      ],
                      ),
                      ),

                      Gap.medium,

                      BlocBuilder<CashbookBloc, CashbookState>(
                          builder: (context,state){
                            return ButtonWL(
                              isLoading: state is Loading,
                              widthChangeOnLoad: false,
                              onPressed: ()=>context.read<CashbookBloc>().add(
                                  AddMember(
                                      phone: CashbookViewModel.memberEmailController.text,
                                      role: MemberRole.values[viewModel.memberRoleType.value].name,
                                      cashbookId: CashbookViewModel.cashbook!.id
                                  )
                              ),
                              label: "Add Member",
                              width: double.infinity,
                              isBlunt: true,
                            );
                          }
                      )
                    ],
                  )
              ),
          );
        }
    );
  }
}





