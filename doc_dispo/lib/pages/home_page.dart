import 'package:doc_dispo/classes/hopital.dart';
import 'package:doc_dispo/main_elements/colors.dart';
import 'package:doc_dispo/main_elements/data.dart';
import 'package:doc_dispo/main_elements/functions.dart';
import 'package:doc_dispo/pages/patient/assurance.dart';
import 'package:doc_dispo/pages/patient/hopital.dart';
import 'package:doc_dispo/pages/patient/rdv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;




    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: size.height / 3,
              width: size.width,
              decoration: BoxDecoration(
                  color: colorWidget,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 25, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/logo.png",
                            height: size.height / 8,
                          ),
                          const CircleAvatar(
                            backgroundImage: AssetImage('images/avatar.png'),
                            radius: 25,
                          )
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Vos rendez vous",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 25),
                        ),

                      ],
                    ),
                  ),
                  Container(
                      height: size.height / 8,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: getProche(currentUser.id).length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> rdv = getProche(currentUser.id)[index];
                            return RdvTemplate(medecin: rdv["medecin"], creneau: rdv["creneau"], specialite: rdv["specialite"]);
                          })),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Hopitaux",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 28),
                        ),
                        Text(
                          "Voir tout",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height / 4,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: list_hopital.length,
                        itemBuilder: (context, index) {
                          print(list_hopital[index+1]);
                          Map<String, List<dynamic>> listM = getAllInformationsHopital(id: list_hopital[index+1]!.id);
                          return HopitalTemplate(hopital: list_hopital[index+1], listAssurance: listM["assurances"],
                            listMedecin: listM["medecins"], listSpecialite: listM["specialites"],);
                        }),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Assurances",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 28),
                        ),
                        Text(
                          "Voir tout",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height / 4,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: list_assurance.length,
                        itemBuilder: (context, index) {
                          List<Hopital> listH = getAllInformationsAssurance(id: list_hopital[index+1]!.id);
                          return AssuranceTemplate(assurance: list_assurance[index+1], listHopitaux: listH,);
                        }),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
