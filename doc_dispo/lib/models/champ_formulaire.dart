

import 'package:doc_dispo/common/style_field.dart';
import 'package:doc_dispo/enums/type_field.dart';
import 'package:flutter/material.dart';

class FormulaireField extends TextFormField
{
  IconData? data;
  String hint;
  TextEditingController controller;
  TypeField typeField;
  final String? Function(String?)? validation;
  bool isPassword = false;
  Widget? suffix;


  FormulaireField( {required this.validation, required this.hint,required this.isPassword, this.suffix,this.data,required this.typeField,required this.controller}):
      super(
        controller: controller,
        obscureText: (isPassword) ? true : false,
        decoration: InputDecoration(
            hintText: hint,
            border: border,
            enabledBorder: border,
            prefixIcon: Icon(data),
          suffixIcon: suffix
        ),
        validator: validation
      );







}