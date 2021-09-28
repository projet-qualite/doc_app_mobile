
import 'package:flutter/material.dart';

class FormulaireField
{
  late TextField field;
  IconData? data;
  String hint;
  TextEditingController controller;
  String? erreurField;
  bool isValid = true;


  FormulaireField({required this.hint, this.data, required this.controller, String? erreurField})
  {
    this.field = TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: this.hint,

            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: (isValid) ? const BorderSide(color: Colors.indigo) : const BorderSide(color: Colors.red)
            ),
            suffixIcon: Icon(data)
        ),

    );
  }


  Widget getField()
  {
    return this.field;
  }

  void setField()
  {
    this.field = TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: this.hint,

          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: (isValid) ? const BorderSide(color: Colors.indigo) : const BorderSide(color: Colors.red)
          ),
          suffixIcon: Icon(data)
      ),

    );
  }


  void validateForm()
  {
    if(!controller.text.contains("@") || !controller.text.contains("."))
    {
      this.isValid = false;
      this.erreurField = "Adresse mail incorrecte";
    }
    else{
      this.erreurField = "Good bro";
    }
  }


  String? getErreurField()
  {
    return this.erreurField;
  }






}