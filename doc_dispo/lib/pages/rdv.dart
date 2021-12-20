import 'package:doc_dispo/common/data.dart';
import 'package:doc_dispo/main_elements/functions.dart';
import 'package:doc_dispo/pages/patient/identite/modifier_email.dart';
import 'package:doc_dispo/pages/patient/identite/modifier_mdp.dart';
import 'package:doc_dispo/pages/patient/identite/modifier_telephone.dart';
import 'package:doc_dispo/pages/patient/proche/liste_proche.dart';
import 'package:doc_dispo/pages/patient/rdv2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rdv extends StatefulWidget {
  RdvState createState() => RdvState();
}

class RdvState extends State<Rdv> {
  late List<Map<String, dynamic>> rdvs;
  late List<Map<String, dynamic>> rdvspasses;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rdvs = getRdvProche(currentUser.id);
    rdvspasses = getRdvPasseProche(currentUser.id);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: Color.fromRGBO(210, 233, 236, 1),
            appBar: AppBar(
              title: const Text(
                "Mes Rendez-vous",
                style: TextStyle(
                    fontFamily: "Roboto", fontWeight: FontWeight.w800),
              ),
              elevation: 0.0,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      width: size.width / 1.3,
                      height: 50,
                      child: TabBar(
                        unselectedLabelColor: Colors.grey,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: const Color.fromRGBO(59, 139, 150, 1),
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.grey,
                        ),
                        tabs: const [
                          Tab(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text("A venir")),
                          ),
                          Tab(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text("Passé")),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                      child: TabBarView(
                        children: [
                          ListView.builder(
                              itemCount: rdvs.length,
                              itemBuilder: (context, index) {
                                var rdv = rdvs[index];
                                return RdvTemplate2(
                                      key: ValueKey(rdv["creneau"].id),
                                      medecin: rdv["medecin"],
                                      creneau: rdv["creneau"],
                                      specialite: rdv["specialite"]
                                );
                              }),
                          ListView.builder(
                              itemCount: rdvspasses.length,
                              itemBuilder: (context, index) {
                                var rdv = rdvspasses[index];
                                return RdvTemplate2(
                                    key: ValueKey(rdv["creneau"].id),
                                    medecin: rdv["medecin"],
                                    creneau: rdv["creneau"],
                                    specialite: rdv["specialite"]
                                );
                              })
                        ],
                      ),
                )
              ],
            )));
  }
}
