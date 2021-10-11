import 'dart:convert';

Creneau CreneauFromJson(String str) => Creneau.fromJson(json.decode(str));
String CreneauToJson(Creneau data) => json.encode(data.toJson());

class Creneau
{
  int id;
  String date_creneau;
  String heure_creneau;
  int id_specialite;
  int id_hopital;
  int id_medecin;
  int etat;

  Creneau({required this.id, required this.date_creneau, required this.heure_creneau, required this.id_specialite,
   required this.id_hopital, required this.id_medecin, required this.etat});


  factory Creneau.fromJson(Map<String, dynamic> json) => Creneau(
      id: json["id"],
      date_creneau: json["date_creneau"],
      heure_creneau: json["heure_creneau"],
      id_specialite: json["id_specialite"],
      id_hopital: json["id_hopital"],
      id_medecin: json["id_medecin"],
      etat: json["etat"]
  );


  Map<String, dynamic> toJson() => {
    "id": id,
    "date_creneau": date_creneau,
    "heure_creneau": heure_creneau,
    "id_specialite": id_specialite,
    "id_hopital": id_hopital,
    "id_medecin": id_medecin,
    "etat": etat,
  };
}
