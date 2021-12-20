import 'package:doc_dispo/common/colors.dart';
import 'package:doc_dispo/pages/home_page.dart';
import 'package:doc_dispo/pages/patient/listes/list_medecin.dart';
import 'package:doc_dispo/pages/profile.dart';
import 'package:doc_dispo/pages/rdv.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget
{
  @override
  NavigationState createState() => NavigationState();
}

class NavigationState extends State<Navigation>
{
  int selectedIndex = 0;


  List<Widget> widgetsOptions = [
    HomePage(),
    ListMedecin(),
    Rdv(),
    Profile(),
  ];

  void _onTapItem(int index)
  {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: colorWidget,
      body: widgetsOptions[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Accueil"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital),
              label: "Medecins"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.date_range),
              label: "Rdv"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile"
          ),
        ],
        currentIndex: selectedIndex,
        onTap: _onTapItem,
        selectedItemColor: colorWidget,
        unselectedItemColor: colorNavigationItemUnselected,
      ),
    );

  }

}