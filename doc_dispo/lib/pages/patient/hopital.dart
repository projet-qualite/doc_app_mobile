import 'package:doc_dispo/classes/assurance.dart';
import 'package:doc_dispo/classes/creneau.dart';
import 'package:doc_dispo/classes/hopital.dart';
import 'package:doc_dispo/classes/medecin.dart';
import 'package:doc_dispo/classes/specialite.dart';
import 'package:doc_dispo/main_elements/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HopitalTemplate extends StatelessWidget
{
  Hopital? hopital;
  List<dynamic>? listMedecin;
  List<dynamic>? listSpecialite;
  List<dynamic>? listAssurance;
  HopitalTemplate({required this.hopital,required this.listMedecin,required this.listSpecialite, required this.listAssurance});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    String image = (hopital!.img_1 == null) ? "images/hopitaux/pisam.png" : "images/hopitaux/"+hopital!.img_1;

    return InkWell(
      child: cardElement(title: hopital!.libelle, subtitle: listMedecin!.length.toString()+" Medecins", image: image, size: size),
      onTap: (){

      },
    );

  }

}