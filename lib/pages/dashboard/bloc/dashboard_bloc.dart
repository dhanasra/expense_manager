import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_manager/db/FirestoreDB.dart';
import 'package:expense_manager/db/model/cashbook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../network/api_client.dart';
import '../../../network/repos/services/cashbook_service.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<GetCashbooks>(onGetCashbooks);
    on<SearchCashBook>(onSearchCashBook);
    on<DeleteCashbook>(onDeleteCashBook);
    on<RenameCashbook>(onRenameCashBook);
  }

  void onDeleteCashBook(DeleteCashbook event, Emitter emit)async{
    emit(CashbooksDeleting());
    List<Cashbook> cashbooks = event.cashbooks;

    CashbookService service = CashbookService(apiClient: ApiClient().init());
    dynamic result = await service.deleteCashbook(cashbookId: event.id);
    cashbooks.removeAt(event.index-1);

    emit(BookDeleted(cashbooks: cashbooks));
  }

  void onRenameCashBook(RenameCashbook event, Emitter emit)async{
    emit(CashbooksRenaming());
    List<Cashbook> cashbooks = event.cashbooks;

    CashbookService service = CashbookService(apiClient: ApiClient().init());
    dynamic result = await service.renameCashbook(
        cashbookName: event.name,
        cashbookId: event.id);
    var resultJson = result["data"]["cashbook"];
    var cashbook = Cashbook.fromJson(resultJson);

    cashbooks[event.index-1] = cashbook;

    emit(BookRenamed(cashbooks: cashbooks));
  }


  void onSearchCashBook(SearchCashBook event, Emitter emit)async{
    List<Cashbook> cashbooks = event.cashbooks.where((e) => e.name.contains(event.text)).toList();
    emit(SearchResult(cashbooks: cashbooks));
  }

  void onGetCashbooks(GetCashbooks event, Emitter emit) async{
    emit(CashbooksLoading());

    CashbookService service = CashbookService(apiClient: ApiClient().init());
    dynamic result = await service.getCashbookList();
    var resultJson = result["data"]["cashbooks"];
    var cashbooks = Cashbook.getCashbooksList(resultJson);
    
    emit(CashbooksFetched(cashbooks: cashbooks));
  }
}
