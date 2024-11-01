import 'package:flutter/material.dart';

class TextFiledSingup extends StatelessWidget {
  TextEditingController controller;
  String hint;
  String text;
  IconData icon;
  TextInputType type;
  TextInputAction action;
  String? Function(String?)? validator;
  bool password;

  TextFiledSingup({
    super.key,
    required this.icon,
   required this.hint,
    required this.type,
    required this.text,
    required this.action,
    required this.controller,
    required this.validator,
    this.password = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
      keyboardType: type,
      textInputAction: action,
      decoration: InputDecoration(
        label: Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        fillColor: Color(0xfff0f0f0),
        filled: true,
       hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            width: 1.5,
            color: Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            width: 1.5,
            color: Colors.transparent,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        suffixIcon: Icon(
          icon,
          color: const Color(0xffF26B0A),
        ),
      ),
      obscureText: password,
    );
  }
}
