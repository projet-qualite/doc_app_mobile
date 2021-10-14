//PageView textes

// PageView 1
import 'dart:collection';

import 'package:doc_dispo/classes/affilier.dart';
import 'package:doc_dispo/classes/assurance.dart';
import 'package:doc_dispo/classes/creneau.dart';
import 'package:doc_dispo/classes/hopital.dart';
import 'package:doc_dispo/classes/medecin.dart';
import 'package:doc_dispo/classes/proche.dart';
import 'package:doc_dispo/classes/rdv.dart';
import 'package:doc_dispo/classes/specialite.dart';
import 'package:doc_dispo/classes/specialites_hopital.dart';
import 'package:doc_dispo/classes/travailler.dart';
import 'package:doc_dispo/classes/utilisateur.dart';

String img_url_1 = "images/icon-home-1.png";
String title_1 = "Trouvez un praticien";
String texte_1 = "Sur la plateforme cherchez un praticien selon vos besoins, l’assurance ainsi que l’hôpital";


// PageView 2
String img_url_2 = "images/icon-home-2.png";
String title_2 = "Prenez un Rdv";
String texte_2 = "Sélectionnet et valider le rendez-vous qui vous convient.";


// PageView 3
String img_url_3 = "images/icon-home-3.png";
String title_3 = "Rappel";
String texte_3 = "Recevez des rappels automatiques par SMS ou par email.";





// Données fictives




List<Affilier> list_affilier = [
  Affilier(id: 1, id_hopital: 1, id_assurance: 1),
  Affilier(id: 2, id_hopital: 1, id_assurance: 2),
  Affilier(id: 3, id_hopital: 2, id_assurance: 1),
  Affilier(id: 4, id_hopital: 2, id_assurance: 2),
];


Map<int, Assurance> list_assurance = {
  1: Assurance(id: 1, slug: "alianz", nom: "Alianz Assurance", logo: "alianz.png"),
  2: Assurance(id: 1, slug: "axa", nom: "Axa Assurance", logo: "axa.png"),
};

Map<int, Creneau> list_creneau = {
  1: Creneau(id: 1, date_creneau: "12-10-2021", heure_creneau: "9:30", id_specialite: 1, id_hopital: 1, id_medecin: 1, etat: 0),
  2: Creneau(id: 2, date_creneau: "12-10-2021", heure_creneau: "10:30", id_specialite: 2, id_hopital: 1, id_medecin: 1, etat: 0),
  3: Creneau(id: 3, date_creneau: "15-10-2021", heure_creneau: "11:30", id_specialite: 1, id_hopital: 1, id_medecin: 2, etat: 0),
  4: Creneau(id: 4, date_creneau: "12-10-2021", heure_creneau: "15:30", id_specialite: 2, id_hopital: 1, id_medecin: 2, etat: 0),
  5: Creneau(id: 5, date_creneau: "15-10-2021", heure_creneau: "08:30", id_specialite: 1, id_hopital: 1, id_medecin: 1, etat: 1),
  6: Creneau(id: 6, date_creneau: "12-10-2021", heure_creneau: "13:30", id_specialite: 2, id_hopital: 1, id_medecin: 2, etat: 1)
};


Map<int, Hopital> list_hopital = {
  1: Hopital(id: 1, slug: "pisam", libelle: "Pisam", adresse: "45 rue de la fonderie", email: "hopital@pisam.ci", telephone: "+2250912189",mot_de_passe: "12345678",
    etat_compte: 1, img_1: "pisam.png", img_2: "pisam2.jpg", img_3: "pisam3.jpg"),
  2: Hopital(id: 2, slug: "chu", libelle: "Chu cocody", adresse: "45 rue de la fonderie", email: "hopital@pisam.ci", telephone: "+2250912189",mot_de_passe: "12345678",
      etat_compte: 1, img_1: "chu.png", img_2: "chu2.jpg", img_3: "")
};


Map<int, Medecin> list_medecin = {
  1: Medecin(id: 1, slug: "fry", nom: "Fry", prenom: "Adou", email: "fry@medecin.ci", telephone: "+2250912189",mot_de_passe: "12345678",type_medecin: "Dr.",sexe: "H",biographie: "Je suis un medecin sérieux",
      etat_compte: 1, img_1: "fry.png", img_2: "", img_3: ""),
  2: Medecin(id: 2, slug: "kouassi", nom: "Kouassi", prenom: "Grâce", email: "kouassi@medecin.ci", telephone: "+2250912189",mot_de_passe: "12345678",type_medecin: "Inf.",sexe: "F",biographie: "Je suis un medecin sérieux",
      etat_compte: 1, img_1: "kouassi.png", img_2: "", img_3: "")
};


Map<int, Proche> list_proche = {
  1: Proche(id: 1, slug: "fry", nom: "Ablaha", prenom: "Andréa", email: "andrea@proche.ci", telephone: "+2250912189",mot_de_passe: "12345678",sexe: "H", date_naissance: "20-12-1995", id_utilisateur: 1),
  2: Proche(id: 2, slug: "fry", nom: "Ange", prenom: "Morrel", email: "morrel@proche.ci", telephone: "+2250912189",mot_de_passe: "12345678",sexe: "H", date_naissance: "10-04-2004", id_utilisateur: 1),
};

Map<int, Rdv> list_rdv = {
  1: Rdv(id: 1, etat: 0, id_creneau: 5, id_beneficiaire: 1, compte_rendu: ""),
  2: Rdv(id: 2, etat: 0, id_creneau: 6, id_beneficiaire: 2, compte_rendu: ""),
};


Map<int, Specialite> list_specialite = {
  1: Specialite(id: 1, slug: "", libelle: "Pédiatrie"),
  2: Specialite(id: 2, slug: "", libelle: "Ophtamologie"),
  3: Specialite(id: 3, slug: "", libelle: "Chirurgie"),
  4: Specialite(id: 4, slug: "", libelle: "Dermatologie"),
  5: Specialite(id: 5, slug: "", libelle: "Deontologie"),
  6: Specialite(id: 6, slug: "", libelle: "Généraliste"),
  7: Specialite(id: 7, slug: "", libelle: "Gynécologie"),
};

Map<int, SpecialitesHopital> list_specialites_hopital = {
  1: SpecialitesHopital(id: 1, id_specialite: 1, id_hopital: 1),
  2: SpecialitesHopital(id: 2, id_specialite: 1, id_hopital: 2),

  3: SpecialitesHopital(id: 3, id_specialite: 2, id_hopital: 1),
  4: SpecialitesHopital(id: 4, id_specialite: 2, id_hopital: 2),

  5: SpecialitesHopital(id: 5, id_specialite: 3, id_hopital: 1),
  6: SpecialitesHopital(id: 6, id_specialite: 3, id_hopital: 2),

  7: SpecialitesHopital(id: 7, id_specialite: 4, id_hopital: 1),
  8: SpecialitesHopital(id: 8, id_specialite: 4, id_hopital: 2),

  9: SpecialitesHopital(id: 9, id_specialite: 5, id_hopital: 1),
  10: SpecialitesHopital(id: 10, id_specialite: 5, id_hopital: 2),

};


Map<int, Travailler> list_travailler = {
  1: Travailler(id: 1, id_specialite: 1, id_hopital: 1, id_medecin: 1),
  2: Travailler(id: 2, id_specialite: 2, id_hopital: 1, id_medecin: 1),
  3: Travailler(id: 3, id_specialite: 1, id_hopital: 1, id_medecin: 2),
  4: Travailler(id: 4, id_specialite: 2, id_hopital: 1, id_medecin: 2),
};



Map<int, Utilisateur> list_utilisateur = {
  1: Utilisateur(id: 1, email: "marshal@gmail.com", telephone: "091289812", mot_de_passe: "12345678"),
  2: Utilisateur(id: 2, email: "cedric@gmail.com", telephone: "091289812", mot_de_passe: "12345678"),
};


dynamic currentUser = list_utilisateur[1];




