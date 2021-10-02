import 'package:doc_dispo/enums/type_field.dart';
import 'package:doc_dispo/models/champ_formulaire.dart';
import 'package:doc_dispo/models/drop_down.dart';
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
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormState>();
    TextEditingController controller = TextEditingController();
    List<String> personnes = <String> ["Un medecin", "Un patient"];

    return Container(
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        child: Center(
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "images/logo.png",
                    width: size.width/1.5,
                  ),

                  Text(
                    "Connexion",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width/10,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Roboto"
                    ),
                  ),


                  Row(
                    children: const [
                      Text(
                        "Vous n’avez pas de compte ? / ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black54
                        ),
                      ),
                      InkWell(
                        child: Text(
                          "Créer en un.",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black
                          ),
                        ),
                      )
                    ],
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
                          hint: "Entrez l'adresse",
                          data: Icons.mail,
                          typeField: TypeField.MAIL,
                          controller: controller,
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
                          hint: "Mot de passe",
                          data: Icons.visibility,
                          typeField: TypeField.PWD,
                          controller: controller,
                          validation: (value){
                            if(value == null || value.isEmpty)
                            {
                              return "Vous devez entrer l'adresse mail";
                            }
                            return validField(value,TypeField.MAIL);
                          },
                        ),

                        const SizedBox(height: 20,),
                        Row(
                          children: const [
                            Text(
                              "Mot de passe oublié ? / ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54
                              ),
                            ),
                            InkWell(
                              child: Text(
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
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
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
                                  "Se connecter",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            )

                          /* ElevatedButton(
                        onPressed: () {
                          print(controller.text);
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        child: const Text('Submit'),
                      ),*/
                        ),
                      ],
                    ),
                  )

                ],
              ),
            )
        ),
      )
    );

  }

}