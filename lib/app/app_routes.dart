import 'package:expense_manager/bloc/contacts_bloc/contacts_bloc.dart';
import 'package:expense_manager/pages/auth/bloc/auth_bloc.dart';
import 'package:expense_manager/pages/auth/views/create_password_page.dart';
import 'package:expense_manager/pages/auth/views/email_page.dart';
import 'package:expense_manager/pages/auth/views/forgot_password_page.dart';
import 'package:expense_manager/pages/auth/views/init_loading_page.dart';
import 'package:expense_manager/pages/auth/views/login_password_page.dart';
import 'package:expense_manager/pages/auth/views/otp_page.dart';
import 'package:expense_manager/pages/auth/views/profile_page.dart';
import 'package:expense_manager/pages/auth/views/reset_password_page.dart';
import 'package:expense_manager/pages/auth/views/welcome_page.dart';
import 'package:expense_manager/pages/cashEntry/bloc/cash_entry_bloc.dart';
import 'package:expense_manager/pages/cashEntry/views/cash_entry_details_page.dart';
import 'package:expense_manager/pages/cashbook/views/cashbook_duplicate_page.dart';
import 'package:expense_manager/pages/category/views/cash_entry_category_page.dart';
import 'package:expense_manager/pages/category/views/cash_entry_category_settings_page.dart';
import 'package:expense_manager/pages/cashEntry/views/cash_entry_create_page.dart';
import 'package:expense_manager/pages/cashEntry/views/cash_entry_field_settings_page.dart';
import 'package:expense_manager/pages/paymentMode/views/cash_entry_payment_mode_page.dart';
import 'package:expense_manager/pages/paymentMode/views/cash_entry_payment_mode_settings_page.dart';
import 'package:expense_manager/pages/cashbook/bloc/cashbook_bloc.dart';
import 'package:expense_manager/pages/cashbook/views/cashbook_create_page.dart';
import 'package:expense_manager/pages/cashbook/views/cashbook_page.dart';
import 'package:expense_manager/pages/cashbook/views/invite_create_page.dart';
import 'package:expense_manager/pages/cashbook/views/member_contact_page.dart';
import 'package:expense_manager/pages/cashbook/views/member_create_page.dart';
import 'package:expense_manager/pages/home/cubit/home_cubit.dart';
import 'package:expense_manager/pages/home/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {

  static const String splash = 'splash';
  static const String noInternet = 'no_internet';

  //authentication
  static const String welcome = 'welcome';
  static const String email = 'email';
  static const String otp = 'otp';
  static const String loginPassword = 'login_password';
  static const String createPassword = 'create_password';
  static const String profile = 'profile';
  static const String forgotPassword = 'forgot_password';
  static const String resetPassword = 'reset_password';
  static const String initLoading = 'initLoading';

  static const String home = 'home';

  //cashbook
  static const String cashbookCreate = 'cashbook_create';
  static const String cashbookDuplicateCreate = 'cashbook_duplicate_create';
  static const String memberCreate = 'member_create';
  static const String memberContactCreate = 'member_contact_create';
  static const String inviteCreate = 'invite_create';
  static const String inviteShare = 'invite_share';
  static const String cashbook = 'cashbook';

  //cash entry
  static const String cashEntryCreate = 'cash_entry_create';
  static const String cashEntryPaymentModes = 'cash_entry_payment_modes';
  static const String cashEntryPaymentModeSettings = 'cash_entry_payment_mode_settings';
  static const String cashEntryCategory = 'cash_entry_category';
  static const String cashEntryCategorySettings = 'cash_entry_category_settings';
  static const String cashEntryFieldSettings = 'cash_entry_field_settings';
  static const String cashEntryDetails = 'cash_entry_details';

  Route getRoutes(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case AppRoutes.cashEntryDetails : return MaterialPageRoute(
          settings: routeSettings, builder: (BuildContext context) => const CashEntryDetailsPage());
      case AppRoutes.cashEntryFieldSettings : return MaterialPageRoute(
          settings: routeSettings, builder: (BuildContext context) => const CashEntryFieldSettingsPage());
      case AppRoutes.cashEntryPaymentModeSettings : return MaterialPageRoute(
          settings: routeSettings, builder: (BuildContext context) => const CashEntryPaymentModeSettingsPage());
      case AppRoutes.cashEntryPaymentModes : return MaterialPageRoute(
          settings: routeSettings, builder: (BuildContext context) => const CashEntryPaymentModePage());
      case AppRoutes.cashEntryCategorySettings : return MaterialPageRoute(
          settings: routeSettings, builder: (BuildContext context) => const CashEntryCategorySettingsPage());
      case AppRoutes.cashEntryCategory : return MaterialPageRoute(
          settings: routeSettings, builder: (BuildContext context) => const CashEntryCategoryPage());
      case AppRoutes.cashEntryCreate : return MaterialPageRoute(
          settings: routeSettings, builder: (BuildContext context) => const CashEntryCreatePage());
      case AppRoutes.memberContactCreate : return MaterialPageRoute(
          settings: routeSettings, builder: (BuildContext context) => const MemberContactPage());
      case AppRoutes.inviteCreate : return MaterialPageRoute(
          settings: routeSettings, builder: (BuildContext context) => const InviteCreatePage());
      case AppRoutes.memberCreate : return MaterialPageRoute(
          settings: routeSettings, builder: (BuildContext context) => const MemberCreatePage());
      case AppRoutes.cashbook : return MaterialPageRoute(
          settings: routeSettings, builder: (BuildContext context) => const CashbookPage());
      case AppRoutes.cashbookDuplicateCreate : return MaterialPageRoute(
          settings: routeSettings, builder: (BuildContext context) => const CashbookDuplicatePage());
      case AppRoutes.cashbookCreate : return MaterialPageRoute(
          settings: routeSettings, builder: (BuildContext context) => const CashbookCreatePage());
      case AppRoutes.home : return MaterialPageRoute(
          settings: routeSettings, builder: (BuildContext context) => const HomePage());
      case AppRoutes.initLoading : return MaterialPageRoute(
          settings: routeSettings, builder: (BuildContext context) => const InitLoadingPage());
      case AppRoutes.profile : return MaterialPageRoute(
          settings: routeSettings, builder: (BuildContext context) => const ProfilePage());
      case AppRoutes.resetPassword : return MaterialPageRoute(
          settings: routeSettings, builder: (BuildContext context) => const ResetPasswordPage());
      case AppRoutes.forgotPassword : return MaterialPageRoute(
          settings: routeSettings, builder: (BuildContext context) => const ForgotPasswordPage());
      case AppRoutes.loginPassword : return MaterialPageRoute(
          settings: routeSettings, builder: (BuildContext context) => const LoginPasswordPage());
      case AppRoutes.createPassword : return MaterialPageRoute(
          settings: routeSettings, builder: (BuildContext context) => const CreatePasswordPage());
      case AppRoutes.otp: return MaterialPageRoute(
          settings: routeSettings, builder: (BuildContext context) => const OtpPage());
      case AppRoutes.email: return MaterialPageRoute(
          settings: routeSettings, builder: (BuildContext context) => const EmailPage());
      case AppRoutes.welcome : return MaterialPageRoute(
          settings: routeSettings, builder: (BuildContext context) => const WelcomePage());
      default: return MaterialPageRoute(
          settings: routeSettings, builder: (BuildContext context) => Container());
    }
  }

  getWidget(BuildContext context, String appRouteName){
    switch(appRouteName) {
      case AppRoutes.cashEntryDetails : return BlocProvider(
          create: (_)=>CashEntryBloc(), child: const CashEntryDetailsPage());
      case AppRoutes.cashEntryFieldSettings : return BlocProvider(
          create: (_)=>CashEntryBloc(), child: const CashEntryFieldSettingsPage());
      case AppRoutes.cashEntryPaymentModeSettings : return BlocProvider(
          create: (_)=>CashEntryBloc(), child: const CashEntryPaymentModeSettingsPage());
      case AppRoutes.cashEntryPaymentModes : return BlocProvider(
          create: (_)=>CashEntryBloc(), child: const CashEntryPaymentModePage());
      case AppRoutes.cashEntryCategorySettings : return BlocProvider(
          create: (_)=>CashEntryBloc(), child: const CashEntryCategorySettingsPage());
      case AppRoutes.cashEntryCategory : return BlocProvider(
          create: (_)=>CashEntryBloc(), child: const CashEntryCategoryPage());
      case AppRoutes.cashEntryCreate : return BlocProvider(
          create: (_)=>CashEntryBloc(), child: const CashEntryCreatePage());
      case AppRoutes.memberContactCreate : return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_)=>CashbookBloc()),
            BlocProvider(create: (_)=>ContactsBloc()..add(GetContacts())),
          ],
          child: const MemberContactPage());
      case AppRoutes.inviteCreate : return BlocProvider(
          create: (_)=>CashbookBloc(), child: const InviteCreatePage());
      case AppRoutes.memberCreate : return BlocProvider(
          create: (_)=>CashbookBloc(), child: const MemberCreatePage());
      case AppRoutes.cashbook : return BlocProvider(
          create: (_)=>CashbookBloc(), child: const CashbookPage());
      case AppRoutes.cashbookDuplicateCreate : return BlocProvider(
          create: (_)=>CashbookBloc(), child: const CashbookDuplicatePage());
      case AppRoutes.cashbookCreate : return BlocProvider(
          create: (_)=>CashbookBloc(), child: const CashbookCreatePage());
      case AppRoutes.home : return BlocProvider(
          create: (_)=>HomeCubit(), child: const HomePage());
      case AppRoutes.initLoading : return BlocProvider(
          create: (_)=>AuthBloc()..add(SetGlobalData()),
          child: const InitLoadingPage());
      case AppRoutes.profile : return BlocProvider(
          create: (_)=>AuthBloc(), child: const ProfilePage());
      case AppRoutes.resetPassword : return BlocProvider(
          create: (_)=>AuthBloc(), child: const ResetPasswordPage());
      case AppRoutes.forgotPassword : return BlocProvider(
          create: (_)=>AuthBloc(), child: const ForgotPasswordPage());
      case AppRoutes.loginPassword : return BlocProvider(
          create: (_)=>AuthBloc(), child: const LoginPasswordPage());
      case AppRoutes.createPassword : return BlocProvider(
          create: (_)=>AuthBloc(), child: const CreatePasswordPage());
      case AppRoutes.otp : return BlocProvider(
          create: (_)=>AuthBloc(), child: const OtpPage());
      case AppRoutes.email : return BlocProvider(
          create: (_)=>AuthBloc(), child: const EmailPage());
      case AppRoutes.welcome : return const WelcomePage();
      default: return Container();
    }
  }

}