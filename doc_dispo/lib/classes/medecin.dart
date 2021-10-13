import 'dart:convert';

Medecin MedecinFromJson(String str) => Medecin.fromJson(json.decode(str));
String MedecinToJson(Medecin data) => json.encode(data.toJson());

class Medecin
{
  int id;
  String? slug;
  String? nom;
  String? prenom;
  String email;
  String? telephone;
  String mot_de_passe;
  String? sexe;
  String? biographie;
  int etat_compte;
  String? type_medecin;
  String? img_1;
  String? img_2;
  String? img_3;

  Medecin({required this.id,  this.slug,  this.nom,  this.prenom,
    required this.email,  this.telephone, required this.mot_de_passe, this.sexe, this.biographie,
     this.etat_compte=0,  this.type_medecin,  this.img_1,  this.img_2, this.img_3});


  factory Medecin.fromJson(Map<String, dynamic> json) => Medecin(
      id: json["id"],
      slug: json["slug"],
      nom: json["nom"],
      prenom: json["prenom"],
      email: json["email"],
      telephone: json["telephone"],
      mot_de_passe: json["mot_de_passe"],
      sexe: json["sexe"],
      biographie: json["biographie"],
      etat_compte: json["etat_compte"],
      type_medecin: json["type_medecin"],
      img_1: json["img_1"],
      img_2: json["img_2"],
      img_3: json["img_3"]
  );


  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "nom": nom,
    "prenom": prenom,
    "email": email,
    "telephone": telephone,
    "mot_de_passe": mot_de_passe,
    "sexe": sexe,
    "biographie": biographie,
    "etat_compte": etat_compte,
    "type_medecin": type_medecin,
    "img_1": img_1,
    "img_2": img_2,
    "img_3": img_3,
  };
}
