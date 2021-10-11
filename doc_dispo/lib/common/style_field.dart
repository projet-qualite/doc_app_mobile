import 'package:flutter/material.dart';

OutlineInputBorder border =  OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide: const BorderSide(color: Colors.black)
);


Widget header({required double width, required String mainTitle, required String subtitle1,required String subtitle2,
  required BuildContext context, required String route, bool back = false})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (back) ? IconButton(
            icon: Icon(Icons.arrow_back_ios), onPressed: () {
              Navigator.of(context).pop();
          },
          ) : Text(""),
          Image.asset(
            "images/logo.png",
            width: (back) ? width/1.8 : width/1.5,
          ),
        ],
      ),

      Text(
        mainTitle,
        style: TextStyle(
            color: Colors.black,
            fontSize: width/10,
            fontWeight: FontWeight.w800,
            fontFamily: "Roboto"
        ),
      ),


      Row(
        children:  [
          Text(
            subtitle1,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black54
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
            },
            child: Text(
              subtitle2,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black
              ),
            ),
          )
        ],
      ),
    ],
  );
}