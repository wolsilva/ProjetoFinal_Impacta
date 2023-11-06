import 'package:flutter/material.dart';
//fonte https://github.com/DevGomes78/Flutter-ViaCep-Api/tree/master

// ignore: must_be_immutable
class TextFormWidget extends StatelessWidget {
  String? labelText;
  String? hintText;
  Widget? icon;
  TextEditingController? controller;
  FormFieldValidator<String>? validator;

  TextFormWidget(
    this.labelText,
    this.hintText, {super.key,
    this.icon,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText ?? '',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: icon,
      ),
      controller: controller,
      validator: validator,
    );
  }
}
