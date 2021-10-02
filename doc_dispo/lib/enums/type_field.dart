

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TypeField{
  MAIL,
  ADRESSE,
  PWD,
  NORMAL,
  SELECT
}





String? validField(String value, TypeField typeField)
{
  switch(typeField)
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