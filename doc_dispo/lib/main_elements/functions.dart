import 'package:doc_dispo/classes/assurance.dart';
import 'package:doc_dispo/classes/creneau.dart';
import 'package:doc_dispo/classes/hopital.dart';
import 'package:doc_dispo/classes/medecin.dart';
import 'package:doc_dispo/classes/proche.dart';
import 'package:doc_dispo/classes/rdv.dart';
import 'package:doc_dispo/classes/specialite.dart';
import 'package:doc_dispo/main_elements/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


List<Map<String, dynamic>> getProche(int id)
{
  List<Map<String, dynamic>> list = [];
  list_proche.forEach((key, proche) {
    if(proche.id_utilisateur == id)
      {
        list_rdv.forEach((key2, rdv) {
          if(rdv.id_beneficiaire == proche.id)
          {
            Creneau? creneau = list_creneau[rdv.id_creneau];
            list.add(
              {
                "medecin": list_medecin[creneau!.id_medecin],
                "creneau": creneau,
                "specialite": list_specialite[creneau.id_specialite]
              }
            );
          }
        });

      }
  });

  return list;
}


Map<String, List<dynamic>> getAllInformationsHopital({required int id})
{
  Map<String, List<dynamic>> list = {};
  List<Medecin?> listMedecin = [];
  List<Specialite?> listSpecialite = [];
  List<Assurance?> listAssurance = [];

  list_travailler.forEach((key, value) {
    if(value.id_hopital == id)
      {
        listMedecin.add(list_medecin[value.id_medecin]);
      }
  });

  list_specialites_hopital.forEach((key, value) {
    if(value.id_hopital == id)
    {
      listSpecialite.add(list_specialite[value.id_specialite]);
    }
  });

  list_affilier.forEach((element) {
    if(element.id_hopital == id)
      {
        listAssurance.add(list_assurance[element.id_assurance]);
      }
  });

  list["medecins"] = listMedecin;
  list["specialites"] = listSpecialite;
  list["assurances"] = listAssurance;

  return list;
}


List<Hopital> getAllInformationsAssurance({required int id})
{
  List<Hopital> listHopitaux = [];


  list_affilier.forEach((element) {
    if(element.id_assurance == id)
    {
      listHopitaux.add(list_hopital[element.id_hopital] ?? Hopital(id: -1, slug: "", libelle: "", adresse: "", email: "", telephone: "", mot_de_passe: "", etat_compte: 0, img_1: "", img_2: "", img_3: ""));
    }
  });

  return listHopitaux;
}



Widget cardElement({required String title, required String subtitle, required Size size, required String image})
{
  return Container(
    margin: const EdgeInsets.only(left: 20, right: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: size.width / 2.2,
            height: size.height / 7,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius:
                BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                  image,
                  width: size.width),
            )),
        Container(
          padding: EdgeInsets.only(left: 10, top: 4),
          child:  Text(
            title,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          child:  Text(
            subtitle,
            style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}



