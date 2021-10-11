import 'dart:async';

import 'package:doc_dispo/pages/home_page.dart';
import 'package:doc_dispo/pages/login.dart';
import 'package:doc_dispo/pages/reset.dart';
import 'package:doc_dispo/pages/signin.dart';
import 'package:flutter/material.dart';

import 'intro_pages/page_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/login': (context) => LogIn(),
       '/reset': (context) => Reset(),
        '/signin': (context) => SignIn(),
        '/home': (context) => HomePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
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
    Timer(Duration(seconds: 5),() => Navigator.pushAndRemoveUntil(
      context,
      _createRoute(),
          (Route<dynamic> route) => false,
    ));
  }


  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    List<String> personnes = <String> ["Un medecin", "Un patient"];
    Size size = MediaQuery.of(context).size;





    return Scaffold(
     backgroundColor: Colors.white,
      body: Container(
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                  "images/logo.png",
                  width: size.width
              ),

            ],
          ),
        )
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

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
