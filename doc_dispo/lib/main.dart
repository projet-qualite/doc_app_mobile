import 'package:flutter/material.dart';
import 'dart:math';

import 'main_elements/colors.dart';
import 'main_elements/data.dart';
import 'main_elements/intro_elements.dart';

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

  PageController controller = PageController(initialPage: 0);
  int currentPageView = 0;

  @override
  Widget build(BuildContext context) {



    return Scaffold(
     backgroundColor: colorWidget,
      body:  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 50,),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {  },
                child: const Text(
                  "Passer",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/1.5,
              child: PageView(
                controller: controller,
                children: [
                  pageViewElement(img_url_1,title_1, texte_1, context),
                  pageViewElement(img_url_2,title_2, texte_2, context),
                  pageViewElement(img_url_3,title_3, texte_3, context),
                ],
                onPageChanged: (value){
                  setState(() {
                    currentPageView = value;
                  });
                },

              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                indicatorPageView(currentPageView, 0),
                indicatorPageView(currentPageView, 1),
                indicatorPageView(currentPageView, 2),

              ],
            ),


          ],

      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
