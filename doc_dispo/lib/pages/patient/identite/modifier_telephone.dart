import 'package:doc_dispo/classes/proche.dart';
import 'package:doc_dispo/common/data.dart';
import 'package:doc_dispo/common/validations_field.dart';
import 'package:doc_dispo/enums/type_field.dart';
import 'package:doc_dispo/models/champ_formulaire.dart';
import 'package:doc_dispo/pages/patient/proche/liste_proche.dart';
import 'package:doc_dispo/pages/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ModifierTelephone extends StatefulWidget {
  ModifierTelephone();

  ModifierTelephoneState createState() => ModifierTelephoneState();
}

class ModifierTelephoneState extends State<ModifierTelephone> {
  TextEditingController controller_phone = TextEditingController();

  late final _formKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKey = GlobalKey<FormState>();
    controller_phone.text = currentUser.telephone;
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(210, 233, 236, 1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Modifier le téléphone",
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
                              "Téléphone",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 15,
                            ),

                            FormulaireField(
                              isPassword: false,
                              number: true,
                              hint: "Téléphone",
                              data: Icons.phone,
                              typeField: TypeField.NORMAL,
                              controller: controller_phone,
                              validation: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Vous devez entrer le numéro de téléphone";
                                }
                                return validField(value, TypeField.NORMAL);
                              },
                              readOnly: false,
                              showDate: () {

                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            InkWell(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {


                                      setState(() {
                                        currentUser.telephone = controller_phone.text;
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
