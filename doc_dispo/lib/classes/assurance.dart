import 'dart:convert';

Assurance AssuranceFromJson(String str) => Assurance.fromJson(json.decode(str));
String AssuranceToJson(Assurance data) => json.encode(data.toJson());

class Assurance
{
  int id;
  String slug;
  String nom;
  String logo;

  Assurance({required this.id, required this.slug, required this.nom, required this.logo});


  factory Assurance.fromJson(Map<String, dynamic> json) => Assurance(
      id: json["id"],
      slug: json["slug"],
      nom: json["nom"],
      logo: json["logo"]
  );


  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "nom": nom,
    "logo": logo,
  };
}
