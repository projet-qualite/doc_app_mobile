import 'package:doc_dispo/pages/login.dart';
import 'package:flutter/material.dart';


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

  String? default_value = null;


  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    List<String> personnes = <String> ["Un medecin", "Un patient"];





    return Scaffold(
     backgroundColor: Colors.white,
      body: LogIn()
      /*Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.15,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropDownField(
                  defaultValue: default_value,
                  personne: personnes,
                  onChanged: (String? newValue){
                    setState(() {
                      default_value = newValue!;
                    });
                  },
                  validator: (value){
                    if(value != "Un medecin" && value != "Un patient")
                      {
                        return "Vous devez sélectionner";
                      }
                    return null;
                  },
                ),
                FormulaireField(
                    hint: "Entrez l'adresse",
                    data: Icons.place,
                    typeField: TypeField.NORMAL,
                    controller: controller,
                  validation: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "erreurField;";
                    }
                    return null;
                  },
                ),




                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      print(controller.text);
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          )
            ],
          )
        )
      )*/
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
