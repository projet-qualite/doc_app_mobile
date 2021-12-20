import 'package:doc_dispo/classes/assurance.dart';
import 'package:doc_dispo/common/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AssuranceTemplate extends StatelessWidget
{
  Assurance? assurance;
  List<dynamic>? listHopitaux;
  AssuranceTemplate({required this.assurance,required this.listHopitaux});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    String image = (assurance!.logo == null) ? "images/assurances/axa.png" : "images/assurances/"+assurance!.logo;

    return InkWell(
      child: templateElementsAccueil(title: assurance!.libelle, subtitle: listHopitaux!.length.toString()+" Hôpitaux", image: image, size: size),
      onTap: (){

      },
    );

  }

}