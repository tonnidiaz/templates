import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget mY(double h){
  return SizedBox(height: h);
}
Widget mX(double h){
  return SizedBox(height: h);
}

Widget h3(String txt){
  return Text(txt, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),);
}

Widget tInputField({
  String title = "Title:",
  String placeholder = "Placeholder...",
  String? value = "",
  Widget? suffix,
  bool readOnly = false,
  void Function(String)? onChanged,
  void Function()? onTap,
}){

  TextEditingController controller = TextEditingController();
  if (value != null){
    controller.value = TextEditingValue(text: value, selection: TextSelection.collapsed(offset: value.length));

  }
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 5),
    child: TextFormField(
      controller: controller,
      readOnly: readOnly,
      //onEditingComplete: (){onChanged!(_controller.value.text);},
      onChanged: onChanged,
      onTap: onTap,
      decoration: InputDecoration(
          label: Text(title),
          hintText: placeholder,
          suffix: suffix,
          labelStyle: const TextStyle(color: Colors.white70),
          contentPadding: const EdgeInsets.symmetric(horizontal : 10, vertical : 7),
          border: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.orange,
                  width: 2
              )
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.orange,
                  width: 2
              )
          )

      ),

    ),
  );
}

