import 'package:flutter/material.dart';

class TextFiledLogin extends StatelessWidget {
  String text;
  IconData icon;
  TextInputType type;
  TextInputAction action;
  TextEditingController controller;
  String? Function(String?)? validator;
  bool password;

  TextFiledLogin({
    super.key,
    required this.text,
    required this.type,
    required this.action,
    required this.icon,
    required this.controller,
    required this.validator,
    this.password = false,
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
        prefixIcon: Icon(
          icon,
          color: Color(0xffe37222)
        ),
        label: Text(
          text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 2,
            color: Colors.orange,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
