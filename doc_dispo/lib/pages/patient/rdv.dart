import 'package:doc_dispo/classes/creneau.dart';
import 'package:doc_dispo/classes/medecin.dart';
import 'package:doc_dispo/classes/specialite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RdvTemplate extends StatelessWidget
{
  Medecin medecin;
  Creneau creneau;
  Specialite specialite;
  RdvTemplate({required this.medecin,required this.creneau,required this.specialite});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(5),
      margin: const EdgeInsets.only(
          left: 20, right: 20, top: 10),
      width: size.width / 1.8,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               const CircleAvatar(
                backgroundImage: //(medecin.img_1 == null) ?
                AssetImage('images/avatar.png'), //: AssetImage('images/'+medecin.img_1!),
                radius: 25,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children:  [
                  SizedBox(
                    width: 120.0,
                    child: Text(
                      medecin.type_medecin!+" "+medecin.nom!+" "+medecin.prenom!,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17),
                    ),

                  ),

                  Text(
                    specialite.libelle,
                    style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 11),
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: const [
                Icon(Icons.event_note),
                SizedBox(
                  width: 15,
                ),
                Text("Sam, 11 Sep., 09.00")
              ],
            ),
          )
        ],
      ),
    );

  }

}