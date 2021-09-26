import 'package:doc_dispo/main_elements/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// PageView element
Widget pageViewElement(String imageUrl, String title, String text, BuildContext context)
{
  return Padding(
    padding: EdgeInsets.all(20),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          imageUrl,
          width: MediaQuery.of(context).size.width/2,
        ),
        const SizedBox(height: 20,),
        Text(
          title,
          style: const TextStyle(
              fontSize: 30,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w900,
              color: Colors.white
          ),),
        const SizedBox(height: 20,),
        Text(
          text,
          style: const TextStyle(
              fontSize: 16,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w200,
              color: Colors.white
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}



Widget indicatorPageView(int currentPageView,int index)
{
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    margin: const EdgeInsets.only(left: 10, right: 10),
    height: 16,
    width: (currentPageView == index ) ? 42 : 25,
    decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(20),
      color: (currentPageView == index ) ? pageViewSelected : pageViewUnselected
    ),
  );
}