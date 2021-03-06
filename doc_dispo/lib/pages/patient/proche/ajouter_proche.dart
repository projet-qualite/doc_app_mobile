
import 'package:doc_dispo/classes/proche.dart';
import 'package:doc_dispo/common/data.dart';
import 'package:doc_dispo/common/validations_field.dart';
import 'package:doc_dispo/enums/type_field.dart';
import 'package:doc_dispo/main_elements/functions.dart';
import 'package:doc_dispo/models/champ_formulaire.dart';
import 'package:doc_dispo/pages/patient/proche/liste_proche.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';


class AjouterProche extends StatefulWidget {
  AjouterProcheState createState() => AjouterProcheState();
}

class AjouterProcheState extends State<AjouterProche> {
  TextEditingController password = TextEditingController();
  TextEditingController controller_mail = TextEditingController();
  TextEditingController controller_nom = TextEditingController();
  TextEditingController controller_prenom = TextEditingController();
  TextEditingController controller_date = TextEditingController();
  TextEditingController controller_phone = TextEditingController();

  String val = "";
  late final _formKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  DateTime currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      locale: Locale("fr"),
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1900),
        lastDate: currentDate);
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        controller_date.text = DateFormat('dd-MM-yyyy').format(pickedDate);
      });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(210, 233, 236, 1),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Ajouter un proche",
          style: TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w800),
        ),
        elevation: 0.0,
      ),
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
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Civilit??",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Text("Masculin"),
                                Radio<String>(
                                  value: "M",
                                  groupValue: val,
                                  onChanged: (value) {
                                    setState(() {
                                      val = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Feminin"),
                                Radio<String>(
                                  value: "F",
                                  groupValue: val,
                                  onChanged: (value) {
                                    setState(() {
                                      val = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        FormulaireField(
                          isPassword: false,
                          hint: "Nom",
                          data: Icons.drive_file_rename_outline,
                          typeField: TypeField.NORMAL,
                          controller: controller_nom,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return "Vous devez entrer le nom";
                            }
                            return validField(value, TypeField.NORMAL);
                          },
                          number: false,
                          readOnly: false,
                          showDate: () {},
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        FormulaireField(
                          isPassword: false,
                          hint: "Prenom",
                          data: Icons.drive_file_rename_outline,
                          typeField: TypeField.NORMAL,
                          controller: controller_prenom,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return "Vous devez entrer le pr??nom";
                            }
                            return validField(value, TypeField.NORMAL);
                          },
                          number: false,
                          showDate: () {},
                          readOnly: false,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            print("FFFFFFF");
                          },
                          child: FormulaireField(
                            isPassword: false,
                            hint: "Date de naissance",
                            data: Icons.date_range,
                            typeField: TypeField.NORMAL,
                            controller: controller_date,
                            validation: (value) {
                              if (value == null || value.isEmpty) {
                                return "Vous devez entrer la date de naissance";
                              }
                              return validField(value, TypeField.NORMAL);
                            },
                            number: false,
                            showDate: () {
                              _selectDate(context);
                            },
                            readOnly: true,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        FormulaireField(
                          isPassword: false,
                          hint: "Email",
                          data: Icons.mail,
                          typeField: TypeField.MAIL,
                          controller: controller_mail,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return "Vous devez entrer l'adresse mail";
                            }
                            return validField(value, TypeField.MAIL);
                          },
                          number: false,
                          showDate: () {},
                          readOnly: false,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        FormulaireField(
                          isPassword: false,
                          number: true,
                          hint: "T??l??phone",
                          data: Icons.phone,
                          typeField: TypeField.NORMAL,
                          controller: controller_phone,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return "Vous devez entrer le num??ro de t??l??phone";
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

                                if(val != "")
                                  {
                                    int id = list_proche.length+1;
                                    list_proche[id] = Proche(
                                                        id: id, slug: controller_nom.text, nom: controller_nom.text, prenom: controller_prenom.text, email: controller_mail.text,
                                                        telephone: controller_phone.text,sexe: val, date_naissance: formatDate(controller_date.text), id_patient: currentUser.id
                                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Enregistrer')),
                                    );
                                  Navigator.push(
                                  context,
                                    MaterialPageRoute(builder: (context) => ListeProche()),
                                  );


                                  }
                                else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Vous devez s??lectionner le genre')),
                                  );
                                }


                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromRGBO(59, 139, 150, 1),
                              ),
                              padding: const EdgeInsets.all(15),
                              child: const Center(
                                child: Text(
                                  "Ajouter",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            )),
          )),
    );
  }
}
