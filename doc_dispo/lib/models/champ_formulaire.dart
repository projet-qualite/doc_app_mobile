

import 'package:doc_dispo/common/style_field.dart';
import 'package:doc_dispo/enums/type_field.dart';
import 'package:flutter/material.dart';

class FormulaireField extends TextFormField
{
  late TextFormField field;
  IconData? data;
  String hint;
  TextEditingController controller;
  String? erreurField;
  bool isValid = true;
  TypeField typeField;
  final String? Function(String?)? validation;


  FormulaireField( {required this.validation, required this.hint, this.data,required this.typeField,required this.controller, String? erreurField}):
      super(
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            border: border,
            enabledBorder: border,
            suffixIcon: Icon(data)
        ),
        validator: validation
      );



  String? validField(String value)
  {
    switch(this.typeField)
    {
      case TypeField.MAIL:
        if(!(value.contains("@") || value.contains(".")))
          {
            return "L'adresse email est incorrecte";
          }
        return null;
        break;


      default:
        return null;
    }
  }


  Widget getField()
  {
    return this.field;
  }




}