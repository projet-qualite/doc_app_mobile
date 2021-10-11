

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TypeField{
  MAIL,
  ADRESSE,
  PWD,
  C_PWD,
  NORMAL,
  SELECT
}





String? validField(String value, TypeField typeField, {String? valueMdp=null})
{
  switch(typeField)
  {
    case TypeField.MAIL:
      if(! ( value.contains("@") || value.contains(".") ) )
      {
        return "L'adresse email est incorrecte";
      }
      return null;
      break;

    case TypeField.PWD:
      if(value.length < 8)
      {
        return "Mot de passe trop court (Minimim 8 caractères)";
      }
      return null;
      break;

    case TypeField.C_PWD:
      if(value != valueMdp)
        {
          print(value);
          print(valueMdp);
          return "Les mots de passes doivent être égaux";
        }
      return null;
      break;



    default:
      return null;
  }
}