import 'package:doc_dispo/classes/utilisateur.dart';
import 'package:doc_dispo/main_elements/data.dart';


bool validationLoginPatient(String email, String mdp)
{
  bool result = false;
  list_utilisateur.forEach((key, value) {
    if(value.email == email && value.mot_de_passe == mdp) {
      result = true;
    }
  });

  return result;
}


Utilisateur? getUser(String email, String mdp)
{
  Utilisateur? result;
  list_utilisateur.forEach((key, value) {
    if(value.email == email && value.mot_de_passe == mdp) {
      result = value;
    }
  });

  return result;
}


bool validationLoginMedecin(String email, String mdp)
{
  bool result = false;
  list_medecin.forEach((key, value) {
    if(value.email == email && value.mot_de_passe == mdp) {
      result = true;
    }
  });

  return result;
}