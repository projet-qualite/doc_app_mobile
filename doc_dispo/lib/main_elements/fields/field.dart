
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doc_dispo/models/champ_formulaire.dart';

class FieldForm extends StatefulWidget{

  FormulaireField field;


  FieldForm({ required this.field});

  void validate()
  {
    this.field.validateForm();
    this.field.setField();
    print(this.field.getErreurField());
    print(this.field.isValid);
  }

  @override
  FieldFormState createState() => FieldFormState();

}

class FieldFormState extends State<FieldForm>
{
  bool eye = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return widget.field.getField();
  }



  /*Widget passwordField(String hint, TextEditingController controller)
  {

    return TextField(
      obscureText: eye,
      decoration: InputDecoration(
          hintText: widget.hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          suffixIcon: (eye) ?
            IconButton(onPressed: () => setState(() => eye = !eye), icon: Icon(Icons.visibility),)


              : IconButton(onPressed: () => setState(() => eye = !eye), icon: const Icon(Icons.visibility_off),)
      )

      );

  }

Widget normalField(String hint, TextEditingController controller, IconData? data)
{
  return TextField(
    controller: controller,
      decoration: InputDecoration(
          hintText: widget.hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          suffixIcon: Icon(data)
      )
  );
}
*/



}

