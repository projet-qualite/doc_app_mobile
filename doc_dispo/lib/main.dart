import 'dart:async';

import 'package:doc_dispo/pages/login.dart';
import 'package:doc_dispo/pages/navigation.dart';
import 'package:doc_dispo/pages/patient/proche/liste_proche.dart';
import 'package:doc_dispo/pages/patient/rdv/choix_date.dart';
import 'package:doc_dispo/pages/profile.dart';
import 'package:doc_dispo/pages/rdv.dart';
import 'package:doc_dispo/pages/reset.dart';
import 'package:doc_dispo/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'pages/page_view.dart';
import 'common/colors.dart';
import 'common/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('fr')
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/login': (context) => LogIn(),
        '/reset': (context) => Reset(),
        '/signin': (context) => SignIn(),
        '/home': (context) => Navigation(),
      },
      theme: ThemeData(primarySwatch: colorCustom),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? default_value = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*Timer(
        Duration(seconds: 5),
        () => Navigator.pushAndRemoveUntil(
              context,
              _createRoute(),
              (Route<dynamic> route) => false,
            ));*/
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        body: //Navigation()
            Rdv()
           /* Center(
          child: Image.asset("images/logo.png", width: size.width / 2),
        )*/
        //DetailMedecin(medecin: list_medecin[1])*/
        //ChoixDate(id_motif_consultation: 1,medecin: list_medecin[2],)
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => IntroPageView(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(4.0, 4.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
