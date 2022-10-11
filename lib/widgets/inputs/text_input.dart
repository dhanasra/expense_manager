import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool isPasswordField;
  final bool obscureText;
  final VoidCallback? suffixIconClick;
  final IconData? endIcon;
  final VoidCallback? onClick;
  final bool isEnabled;
  final bool autoFocus;
  final String? errorText;
  final bool required;
  final String? validateText;
  final TextInputType inputType;
  final TextEditingController controller;

  const TextInput({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.validateText,
    this.obscureText = false,
    this.isPasswordField = false,
    this.endIcon,
    this.required = true,
    this.inputType = TextInputType.text,
    this.suffixIconClick,
    this.onClick,
    this.errorText,
    this.autoFocus = false,
    this.isEnabled = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: TextFormField(
        autofocus: autoFocus,
        keyboardType: inputType,
        decoration: InputDecoration(
          enabled: isEnabled,
          labelText: labelText,
          hintText: hintText,
          errorText: errorText,
          suffixIcon: endIcon!=null ? Icon(endIcon) : isPasswordField
              ? GestureDetector(
            onTap: suffixIconClick,
            child: obscureText
                ? const Icon(Icons.remove_red_eye) : const Icon(Icons.remove_red_eye_outlined),
          )
              : null,
        ),
        validator: (val){
          return required && val!=null && val.isEmpty
              ? "$labelText is required"
              : validateText!=null && validateText!.toLowerCase()!=val!.toLowerCase()
              ? "$labelText is not matching $validateText"
              : null;
        },
        obscureText: obscureText,
        obscuringCharacter: '*',
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600
        ),
        controller: controller,
      ),
    );
  }
}