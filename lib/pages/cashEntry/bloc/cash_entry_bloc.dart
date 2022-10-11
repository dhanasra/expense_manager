import 'package:bloc/bloc.dart';
import 'package:expense_manager/db/model/cash_entry.dart';
import 'package:meta/meta.dart';

part 'cash_entry_event.dart';
part 'cash_entry_state.dart';

class CashEntryBloc extends Bloc<CashEntryEvent, CashEntryState> {
  CashEntryBloc() : super(CashEntryInitial()) {
    on<CashEntryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
