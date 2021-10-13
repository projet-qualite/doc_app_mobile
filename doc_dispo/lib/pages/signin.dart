import 'package:doc_dispo/classes/medecin.dart';
import 'package:doc_dispo/classes/utilisateur.dart';
import 'package:doc_dispo/common/style_field.dart';
import 'package:doc_dispo/enums/type_field.dart';
import 'package:doc_dispo/models/champ_formulaire.dart';
import 'package:doc_dispo/models/drop_down.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:doc_dispo/main_elements/data.dart';
class SignIn extends StatefulWidget
{
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn>
{
  String? default_value = null;
  bool isPassword1 = true;
  bool isPassword2 = true;
  TextEditingController password = TextEditingController();
  TextEditingController controller_mail = TextEditingController();
  TextEditingController controller_mdp = TextEditingController();
  TextEditingController controller_cmdp = TextEditingController();
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormState>();

    List<String> personnes = <String> ["Un medecin", "Un patient"];


    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Center(
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      header(width: size.width, mainTitle: "Inscription",
                          subtitle1: "Vous avez déjà un compte ? / ",subtitle2: "Connexion.",
                          context: context,
                          route: '/login'
                      ),

                      const SizedBox(height: 40,),


                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            DropDownField(
                              defaultValue: default_value,
                              personne: personnes,
                              onChanged: (String? newValue){
                                setState(() {
                                  default_value = newValue!;
                                });
                              },
                              validator: (value){
                                if(value != "Un medecin" && value != "Un patient")
                                {
                                  return "Vous devez sélectionner une option";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 30,),
                            FormulaireField(
                              isPassword: false,
                              hint: "Email",
                              data: Icons.mail,
                              typeField: TypeField.MAIL,
                              controller: controller_mail,
                              validation: (value){
                                if(value == null || value.isEmpty)
                                {
                                  return "Vous devez entrer l'adresse mail";
                                }
                                return validField(value,TypeField.MAIL);
                              },
                            ),


                            const SizedBox(height: 30,),

                            FormulaireField(
                              isPassword: isPassword1,
                              suffix: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      isPassword1=!isPassword1;
                                    });
                                  }, child: Icon( (isPassword1) ? Icons.visibility : Icons.visibility_off)
                              ),
                              hint: "Mot de passe",
                              data: Icons.lock,
                              typeField: TypeField.PWD,
                              controller: controller_mdp,
                              validation: (value){
                                if(value == null || value.isEmpty)
                                {
                                  return "Entrez le mot de passe";
                                }
                                return validField(value,TypeField.PWD);
                              },
                            ),

                            const SizedBox(height: 30,),
                            FormulaireField(
                              isPassword: isPassword2,
                              suffix: IconButton(onPressed: () => setState(() => isPassword2=!isPassword2),
                                  icon: (isPassword2) ? const Icon(Icons.visibility) : const Icon(Icons.visibility)),
                              hint: "Confirmer le mot de passe",
                              data: Icons.lock,
                              typeField: TypeField.PWD,
                              controller: controller_cmdp,
                              validation: (value){
                                if(value == null || value.isEmpty)
                                {
                                  return "Confirmez le mot de passe";
                                }
                                return validField(value,TypeField.C_PWD, valueMdp: controller_mdp.text);
                              },
                            ),

                            const SizedBox(height: 40,),




                            InkWell(
                                onTap: (){
                                  if (_formKey.currentState!.validate()) {
                                    // If the form is valid, display a snackbar. In the real world,
                                    // you'd often call a server or save the information in a database.

                                    var index;
                                    if(default_value == "Un patient")
                                      {
                                        index = list_utilisateur.length+1;
                                        list_utilisateur[index] = Utilisateur(id: index, email: controller_mail.text, mot_de_passe: controller_mdp.text);
                                      }
                                    else{
                                      index = list_medecin.length+1;
                                      list_medecin[index] = Medecin(id: index, email: controller_mail.text, mot_de_passe: controller_mdp.text);
                                    }

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Processing Data')),
                                    );
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color.fromRGBO(59, 139, 150, 1),
                                  ),
                                  padding: const EdgeInsets.all(20),
                                  child: const Center(
                                    child: Text(
                                      "S'inscrire",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                )

                            ),

                          ],
                        ),
                      )

                    ],
                  ),
                )
            ),
          )
      ),
    );

  }

}