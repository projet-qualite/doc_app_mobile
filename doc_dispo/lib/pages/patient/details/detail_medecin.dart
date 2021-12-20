import 'package:doc_dispo/classes/creneau.dart';
import 'package:doc_dispo/classes/jour.dart';
import 'package:doc_dispo/classes/medecin.dart';
import 'package:doc_dispo/common/colors.dart';
import 'package:doc_dispo/common/data.dart';
import 'package:doc_dispo/main_elements/functions.dart';
import 'package:doc_dispo/pages/patient/rdv/choix_motif.dart';
import 'package:flutter/material.dart';
import 'package:doc_dispo/common/colors.dart';

class DetailMedecin extends StatefulWidget {
  Medecin? medecin;

  DetailMedecin({required this.medecin});

  DetailMedecinState createState() => DetailMedecinState();
}

class DetailMedecinState extends State<DetailMedecin> {
  String specialite = "";
  String hopital = "";
  Map<String, List<Creneau>> list = {};
  List<Creneau> creneaux = [];
  bool lire_plus = false;
  late Jour jour;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    specialite = getSpecialiteMedecin(id: widget.medecin!.id)!.libelle;
    hopital = list_hopital[widget.medecin!.id_hopital]!.libelle;
    print(hopital);

    list_creneau.forEach((key, value) => {
          if (value != null && value.id_medecin == widget.medecin!.id!)
            {
              print(value),
              if (list[value.jour] == null)
                {
                  list[value.jour] = [value]
                }
              else
                {
                  creneaux = list[value.jour]!,
                  creneaux.add(value),
                  list[value.jour] = creneaux
                }
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    bool active = false;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: size.height / 2,
                width: size.width,
                color: Colors.green,
                child: Image.asset(
                  "images/medecins/" + widget.medecin!.img_1!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                top: 40,
                left: 20,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Padding(
                    padding: EdgeInsets.only(left: 9),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                )),
            Positioned(
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0))),
                  height: size.height / 1.5,
                  width: size.width,
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.medecin!.type! +
                                  " " +
                                  widget.medecin!.nom! +
                                  " " +
                                  widget.medecin!.prenom!,
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              hopital,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              specialite,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              widget.medecin!.biographie!,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black),
                              textAlign: TextAlign.justify,
                            ),

                            /*Container(
                            margin: const EdgeInsets.only(right: 20),
                            height: 90,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: list.length,
                                itemBuilder: (context, index) {
                                  String key = list.keys.elementAt(index);

                                  int day = int.parse(key.split("-")[0]);
                                  int month = int.parse(key.split("-")[1]);
                                  int year = int.parse(key.split("-")[2]);

                                  DateTime date = DateTime(year, month, day);

                                  jour = Jour(
                                      dayWeek: date.weekday,
                                      day: date.day,
                                      heures: list[key]!);
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        //print("hh: "+hh.toString());
                                        jour.setSelected(!jour.selected);
                                        print("selected: " +
                                            jour.selected.toString());
                                      });
                                    },
                                    child: Container(
                                        width: 80,
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: (jour.selected)
                                                ? colorWidget
                                                : Colors.white,
                                            border: Border.all(
                                                color: Colors.black, width: 2.0)),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                jour.day.toString(),
                                                style: TextStyle(
                                                    color: (jour.selected)
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              Text(
                                                jour.toString(),
                                                style: TextStyle(
                                                    color: (jour.selected)
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        )),
                                  );
                                }),
                          )*/
                          ],
                        ),
                      )),
                )),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: InkWell(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: colorWidget,
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight:  Radius.circular(30)) ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 9),
                      child: Center(
                        child: Text(
                          "Prendre rendez-vous en ligne",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChoixMotif(medecin: widget.medecin)),
                    );
                  },
                )
            ),
          ],
        ));
  }
}
