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