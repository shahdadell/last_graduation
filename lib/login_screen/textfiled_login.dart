import 'package:flutter/material.dart';

class TextFiledLogin extends StatelessWidget {
  String text;
  IconData icon;
  TextInputType type;
  TextInputAction action;
  TextEditingController controller;
  String? Function(String?)? validator;
  bool password;
  bool obsecureText;

  TextFiledLogin({
    super.key,
    required this.text,
    required this.type,
    required this.action,
    required this.icon,
    required this.controller,
    required this.validator,
    this.password = false,
    this.obsecureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: password,
      validator: validator,
      controller: controller,
      keyboardType: type,
      textInputAction: action,
      decoration: InputDecoration(
        // fillColor: Color(0xffF0F0F0FF),
        // filled: true,
        label: Text(
          text,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 2.5,
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 1.2,
            color: Colors.orange,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.2),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        suffixIcon: Icon(
          icon,
          color: const Color(0xffF26B0A),
        ),
      ),
    );
  }
}
