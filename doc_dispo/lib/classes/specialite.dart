import 'dart:convert';

Specialite SpecialiteFromJson(String str) => Specialite.fromJson(json.decode(str));
String SpecialiteToJson(Specialite data) => json.encode(data.toJson());

class Specialite
{
  int id;
  String slug;
  String libelle;

  Specialite({required this.id, required this.slug, required this.libelle});


  factory Specialite.fromJson(Map<String, dynamic> json) => Specialite(
      id: json["id"],
      slug: json["slug"],
      libelle: json["libelle"]
  );


  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "libelle": libelle
  };
}
