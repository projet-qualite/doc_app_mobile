import 'package:doc_dispo/main_elements/fields/field.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'intro_pages/page_view.dart';
import 'main_elements/colors.dart';
import 'main_elements/data.dart';
import 'main_elements/intro_elements.dart';
import 'models/champ_formulaire.dart';

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

  


  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    FieldForm field1 = FieldForm(field: FormulaireField(hint: "Adresse",  controller: controller, data: Icons.android));


    return Scaffold(
     backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.15,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              field1,
              ElevatedButton(onPressed: (){
                setState(() {
                  field1.validate();
                });
              }, child: const Text("Valider"))
            ],
          )
        )
      )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
