import 'package:easy_localization/easy_localization.dart';
import 'package:expense_manager/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          projectId: 'expense-manager-85104',
          apiKey: 'AIzaSyA4mHTurOAIlUq8SQElygAAKL5VMuP2M2M',
          messagingSenderId: '320129346407',
          appId: '1:320129346407:android:8ea74cd106c86397421dc2'
      )
  );

  runApp(
      EasyLocalization(
          supportedLocales: const [Locale('en'), Locale('ta')],
          path: 'assets/language',
          fallbackLocale: const Locale('ta'),
          child:  const App() ));
}
