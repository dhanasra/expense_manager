
import 'package:bloc/bloc.dart';
import 'package:expense_manager/db/model/cashbook.dart';
import 'package:expense_manager/db/model/member.dart';
import 'package:expense_manager/network/api_client.dart';
import 'package:expense_manager/network/repos/services/cashbook_service.dart';
import 'package:expense_manager/network/repos/services/member_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'cashbook_event.dart';
part 'cashbook_state.dart';

class CashbookBloc extends Bloc<CashbookEvent, CashbookState> {

  CashbookBloc() : super(CashbookInitial()) {
    on<CreateCashbook>(onCreateCashbook);
    on<AddMember>(onAddMember);
  }

  void onCreateCashbook(CreateCashbook event, Emitter emit) async{
    try{
      emit(Loading());
      if(event.name.isEmpty) {
        emit(Failure(message: "Cashbook Name is required"));
        return;
      }

      CashbookService service = CashbookService(apiClient: ApiClient().init());
      dynamic result = await service.addCashbook(cashbookName: event.name, isPrivate: event.isPrivate);
      var resultJson = result["data"]["cashbook"];
      var cashbook = Cashbook.fromJson(resultJson);

      emit(CashbookCreated(cashbook: cashbook));
    }on FirebaseException catch(e){
      emit(Failure(message: e.message??"Sorry buddy, Something went wrong. Try again later!"));
    }
  }

  void onAddMember(AddMember event, Emitter emit) async {
    emit(Loading());
    try{

      MemberService service = MemberService(apiClient: ApiClient().init());
      dynamic result = await service.addMember(cashbookId: event.cashbookId, mobileNumber: event.phone, role: event.role);
      var resultJson = result["data"]["member"];
      var member = Member.fromJson(resultJson);

      emit(MemberAdded());
    }on FirebaseException catch(e){
      emit(Failure(message: e.message??"Sorry buddy, Something went wrong. Try again later!"));
    }
  }
}
