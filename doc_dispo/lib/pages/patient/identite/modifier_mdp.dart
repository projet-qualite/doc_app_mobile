import 'package:doc_dispo/classes/proche.dart';
import 'package:doc_dispo/common/data.dart';
import 'package:doc_dispo/common/validations_field.dart';
import 'package:doc_dispo/enums/type_field.dart';
import 'package:doc_dispo/models/champ_formulaire.dart';
import 'package:doc_dispo/pages/patient/proche/liste_proche.dart';
import 'package:doc_dispo/pages/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ModifierMdp extends StatefulWidget {

  ModifierMdpState createState() => ModifierMdpState();
}

class ModifierMdpState extends State<ModifierMdp> {
  TextEditingController controllerAMdp = TextEditingController();
  TextEditingController controllerMdp = TextEditingController();
  bool isPassword = true;

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

    return Scaffold(
      backgroundColor: Color.fromRGBO(210, 233, 236, 1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Modifier le mot de passe",
          style: TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w800),
        ),
        elevation: 0.0,
      ),
      body: Container(
          child: SingleChildScrollView(
            child: Center(
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Email",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 15,
                            ),

                            FormulaireField(
                              isPassword: isPassword,
                              suffix: (isPassword)
                                  ? IconButton(
                                  onPressed: () => setState(
                                          () => isPassword = !isPassword),
                                  icon: const Icon(Icons.visibility))
                                  : IconButton(
                                  onPressed: () => setState(
                                          () => isPassword = !isPassword),
                                  icon: const Icon(Icons.visibility_off)),
                              hint: "Ancien mot de passe",
                              data: Icons.lock,
                              typeField: TypeField.PWD,
                              controller: controllerAMdp,
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Vous devez entrer le mot de passe";
                                }
                                return validField(value, TypeField.PWD);
                              }, number: false, showDate: () {  }, readOnly: false,
                            ),

                            const SizedBox(
                              height: 15,
                            ),

                            FormulaireField(
                              isPassword: isPassword,
                              suffix: (isPassword)
                                  ? IconButton(
                                  onPressed: () => setState(
                                          () => isPassword = !isPassword),
                                  icon: const Icon(Icons.visibility))
                                  : IconButton(
                                  onPressed: () => setState(
                                          () => isPassword = !isPassword),
                                  icon: const Icon(Icons.visibility_off)),
                              hint: "Nouveau mot de passe",
                              data: Icons.lock,
                              typeField: TypeField.PWD,
                              controller: controllerMdp,
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Vous devez entrer le mot de passe";
                                }
                                return validField(value, TypeField.PWD);
                              }, number: false, showDate: () {  }, readOnly: false,
                            ),

                            const SizedBox(
                              height: 30,
                            ),
                            InkWell(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {

                                    if(controllerAMdp.text == currentUser.mdp)
                                      {
                                        setState(() {
                                          currentUser.mdp = controllerMdp.text;
                                      });
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                              content: Text('Enregistrer')),
                                        );
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => Profile()),
                                        );
                                      }
                                    else{
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text('Mot de passe incorrect')),
                                      );
                                    }



                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromRGBO(59, 139, 150, 1),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: const Center(
                                    child: Text(
                                      "Modifier",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom))

                    ],
                  ),
                )),
          )),
    );
  }
}
