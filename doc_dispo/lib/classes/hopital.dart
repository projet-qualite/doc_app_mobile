import 'dart:convert';

Hopital HopitalFromJson(String str) => Hopital.fromJson(json.decode(str));
String HopitalToJson(Hopital data) => json.encode(data.toJson());

class Hopital
{
  int id;
  String slug;
  String libelle;
  String adresse;
  String email;
  String telephone;
  String mot_de_passe;
  int etat_compte;
  String img_1;
  String img_2;
  String img_3;

  Hopital({required this.id, required this.slug, required this.libelle, required this.adresse,
    required this.email, required this.telephone, required this.mot_de_passe,required this.etat_compte,
    required this.img_1, required this.img_2,required this.img_3});




  factory Hopital.fromJson(Map<String, dynamic> json) => Hopital(
      id: json["id"],
      slug: json["slug"],
      libelle: json["libelle"],
      adresse: json["adresse"],
      email: json["email"],
      telephone: json["telephone"],
      mot_de_passe: json["mot_de_passe"],
      etat_compte: json["etat_compte"],
      img_1: json["img_1"],
      img_2: json["img_2"],
      img_3: json["img_3"]
  );


  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "libelle": libelle,
    "adresse": adresse,
    "email": email,
    "telephone": telephone,
    "mot_de_passe": mot_de_passe,
    "etat_compte": etat_compte,
    "img_1": img_1,
    "img_2": img_2,
    "img_3": img_3,
  };
}
