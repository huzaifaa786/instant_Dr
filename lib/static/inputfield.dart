// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({super.key, this.hint,this.controller,this.obscure = false,this.type = TextInputType.text,this.onchange});
  final hint;
  final controller;
  final obscure;
  final type;
  final onchange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: controller,
        onChanged: onchange,
        obscureText: obscure,
        keyboardType: type,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[300],
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30.0),
          ),
          hintText: hint,
          hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}