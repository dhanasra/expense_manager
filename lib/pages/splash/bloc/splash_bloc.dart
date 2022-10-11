import 'package:bloc/bloc.dart';
import 'package:expense_manager/db/local_db.dart';
import 'package:meta/meta.dart';
import '../../../utils/globals.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashInit>(init);
  }

  void init(SplashInit event, Emitter emit) async{
    bool? isFirstLaunch = await LocalDB.getBool(LocalDBKeys.isFirstLaunch);

    if(isFirstLaunch??true){

      emit(Login());
    }else{

      Globals.name = await LocalDB.get(LocalDBKeys.name)??"";
      Globals.photo = await LocalDB.get(LocalDBKeys.photo)??"";

      if(Globals.name.isEmpty && Globals.photo.isEmpty){
        emit(Profile());
      }else{
        emit(Home());
      }

    }
  }
}
