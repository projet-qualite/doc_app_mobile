import 'package:doc_dispo/common/style_field.dart';
import 'package:doc_dispo/enums/type_field.dart';
import 'package:doc_dispo/main_elements/data.dart';
import 'package:doc_dispo/models/champ_formulaire.dart';
import 'package:doc_dispo/models/drop_down.dart';
import 'package:doc_dispo/validation/validations_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
class LogIn extends StatefulWidget
{
  LogInState createState() => LogInState();
}

class LogInState extends State<LogIn>
{
  String? default_value = null;
  bool isPassword = true;
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerMdp = TextEditingController();
  late final _formKey;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKey = GlobalKey<FormState>();
  }


  @override
  Widget build(BuildContext context) {



    Size size = MediaQuery.of(context).size;


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
                      header(width: size.width, mainTitle: "Connexion",
                          subtitle1: "Vous n'avez pas de compte ? / ",subtitle2: "Créer en un.",
                          context: context,
                          route: '/signin'
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
                              hint: "Entrez l'adresse",
                              data: Icons.mail,
                              typeField: TypeField.MAIL,
                              controller: controllerEmail,
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
                              isPassword: isPassword,
                              suffix: (isPassword) ?
                              IconButton(onPressed: () => setState(() => isPassword=!isPassword), icon: const Icon(Icons.visibility))
                                  :IconButton(onPressed: () => setState(() => isPassword=!isPassword), icon: const Icon(Icons.visibility_off)),
                              hint: "Mot de passe",
                              data: Icons.lock,
                              typeField: TypeField.PWD,
                              controller: controllerMdp,
                              validation: (value){
                                if(value == null || value.isEmpty)
                                {
                                  return "Vous devez entrer le mot de passe";
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 20,),
                            Row(
                              children:  [
                                const Text(
                                  "Mot de passe oublié ? / ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54
                                  ),
                                ),
                                InkWell(
                                  onTap: (){

                                    Navigator.pushNamed(context, '/reset');
                                  },
                                  child: const Text(
                                    "Réinitialiser",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black
                                    ),
                                  ),
                                )
                              ],
                            ),


                            const SizedBox(height: 50,),


                            InkWell(
                                onTap: (){
                                  if (_formKey.currentState!.validate()) {


                                    switch(default_value){
                                      case "Un patient":
                                        if(validationLoginPatient(controllerEmail.text, controllerMdp.text))
                                        {
                                          currentUser = getUser(controllerEmail.text, controllerMdp.text);
                                          Navigator.of(context)
                                              .pushNamedAndRemoveUntil("/home", (Route<dynamic> route) => false);
                                        }
                                        else{
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text('Email ou mot de passe incorrect')),
                                          );
                                        }
                                        break;

                                      case "Un medecin":
                                        if(validationLoginMedecin(controllerEmail.text, controllerMdp.text))
                                        {
                                          Navigator.of(context)
                                              .pushNamedAndRemoveUntil("/home", (Route<dynamic> route) => false);
                                        }
                                        else{
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text('Email ou mot de passe incorrect')),
                                          );
                                        }
                                        break;
                                    }



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
                                      "Se connecter",
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