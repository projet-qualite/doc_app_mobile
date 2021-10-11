import 'dart:convert';

Proche ProcheFromJson(String str) => Proche.fromJson(json.decode(str));
String ProcheToJson(Proche data) => json.encode(data.toJson());

class Proche
{
  int id;
  String slug;
  String nom;
  String prenom;
  String email;
  String date_naissance;
  String telephone;
  String mot_de_passe;
  String sexe;
  int id_utilisateur;

  Proche({required this.id, required this.slug, required this.nom, required this.prenom,
    required this.email, required this.telephone, required this.mot_de_passe,required this.sexe,required this.date_naissance,
    required this.id_utilisateur});


  factory Proche.fromJson(Map<String, dynamic> json) => Proche(
      id: json["id"],
      slug: json["slug"],
      nom: json["nom"],
      prenom: json["prenom"],
      email: json["email"],
      telephone: json["telephone"],
      mot_de_passe: json["mot_de_passe"],
      sexe: json["sexe"],
      date_naissance: json["date_naissance"],
      id_utilisateur: json["id_utilisateur"],
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
    "date_naissance": date_naissance,
    "id_utilisateur": id_utilisateur,

  };
}
