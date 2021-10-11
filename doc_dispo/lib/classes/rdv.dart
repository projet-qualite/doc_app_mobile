import 'dart:convert';

Rdv RdvFromJson(String str) => Rdv.fromJson(json.decode(str));
String RdvToJson(Rdv data) => json.encode(data.toJson());

class Rdv
{
  int id;
  int etat;
  int id_creneau;
  int id_beneficiaire;
  String compte_rendu;

  Rdv({required this.id, required this.etat, required this.id_creneau, required this.id_beneficiaire, required this.compte_rendu});


  factory Rdv.fromJson(Map<String, dynamic> json) => Rdv(
      id: json["id"],
    etat: json["etat"],
    id_creneau: json["id_creneau"],
      id_beneficiaire: json["id_beneficiaire"],
    compte_rendu: json["compte_rendu"]
  );


  Map<String, dynamic> toJson() => {
    "id": id,
    "etat": etat,
    "id_creneau": id_creneau,
    "id_beneficiaire": id_beneficiaire,
    "compte_rendu": compte_rendu
  };
}
