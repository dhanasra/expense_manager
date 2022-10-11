import 'package:currency_picker/currency_picker.dart';
import 'package:expense_manager/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:pinput/pinput.dart';

class AuthViewModel {
  static late AuthViewModel _instance;
  factory AuthViewModel() {
    _instance = AuthViewModel._internal();
    return _instance;
  }

  GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();

  PinTheme? defaultPinTheme;
  PinTheme? focusedPinTheme;
  PinTheme? submittedPinTheme;

  AuthViewModel._internal(){
    defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500
      ),
      decoration: BoxDecoration(
        border: Border.all(color: subText),
        borderRadius: BorderRadius.circular(4),
      ),
    );

    focusedPinTheme = defaultPinTheme?.copyDecorationWith(
      border: Border.all(color: primary),
      borderRadius: BorderRadius.circular(4),
    );

    submittedPinTheme = defaultPinTheme?.copyWith(
      decoration: defaultPinTheme?.decoration?.copyWith(
        color: border,
      ),
    );
  }

  final PageController controller = PageController();

  final ValueNotifier<int> carouselState = ValueNotifier(0);

  final ValueNotifier<bool> passwordViewState = ValueNotifier(true);
  final ValueNotifier<bool> confirmPasswordViewState = ValueNotifier(true);

  static TextEditingController emailController = TextEditingController();
  static TextEditingController phoneNumberController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController confirmPasswordController = TextEditingController();
  static TextEditingController firstNameController = TextEditingController();
  static TextEditingController lastNameController = TextEditingController();

  static Currency? defaultCurrency;
  static Country? selectedCountry;
  static Map<String,String>? language;

  static String otp = 'xxxxxx';

}