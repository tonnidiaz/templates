import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../stores/app.dart';
import '../utils/constants.dart';

Widget mY(double h) {
  return SizedBox(height: h);
}

Widget mX(double h) {
  return SizedBox(height: h);
}

Widget h3(String txt) {
  return Text(
    txt,
    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
  );
}

class TInputField extends StatefulWidget {
  String title;
  String placeholder;
  String? value;
  Widget? suffix;
  bool readOnly;
  void Function(String)? onChanged;
  void Function()? onTap;
  TInputField({
    super.key,
    this.title = "Title:",
    this.placeholder = "Placeholder...",
    this.value = "",
    this.suffix,
    this.readOnly = false,
    this.onChanged,
    this.onTap,
  });

  @override
  State<TInputField> createState() => _TInputFieldState();
}

class _TInputFieldState extends State<TInputField> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.value != null && widget.value != controller.text) {
      controller.text = widget.value!;
    } else if (widget.value == null) {
      controller.text = "";
    }
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        readOnly: widget.readOnly,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        decoration: InputDecoration(
            label: Text(widget.title),
            hintText: widget.placeholder,
            suffixIcon: widget.suffix,
            labelStyle: const TextStyle(color: Colors.white70),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange, width: 2)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange, width: 2))),
      ),
    );
  }
}

Widget NavItem({String text = "", void Function()? onClick}) {
  return InkWell(
    onTap: onClick,
    child: Container(
      width: double.infinity,
      //color: const Color.fromRGBO(30, 30, 30, .2),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 15),
      ),
    ),
  );
}

Widget sizedText(AppStore appStore, String text,
    {double width = 150, double fs = 16, Color color = Colors.white70}) {
  return SizedBox(
      width: width,
      child: Text(
        text,
        softWrap: false,
        style: TextStyle(
          fontSize: fs,
          overflow: TextOverflow.fade,
          color: color,
        ),
      ));
}

class TDropdownButton extends StatelessWidget {
  Object? value;
  void Function(Object?)? onChanged;
  String? label = "Dropdown";
  Function(Object)? itemLabel;
  double? width;
  bool disabled;
  List<Object>? items = [];
  TDropdownButton(
      {Key? key,
      this.items,
      this.value,
      this.label,
      this.width,
      this.onChanged,
      this.itemLabel,
      this.disabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    width ??= screenSize(context).width;
    return Container(
      width: width,
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(vertical: 2.5),
      decoration: BoxDecoration(
          color: btnBG,
          border: Border.all(color: titlebarBG, width: 2),
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButton(
          value: value, // ?? formats[0],
          dropdownColor: btnBG,
          underline: Container(),
          isExpanded: true,
          borderRadius: BorderRadius.circular(5),
          hint: SizedBox(child: Text("$label")),
          items: items!.map((e) {
            return DropdownMenuItem(
              value: e.toString().toLowerCase(),
              child: Text(itemLabel != null
                  ? itemLabel!(e)
                  : e.toString().toUpperCase()),
            );
          }).toList(),
          onChanged: disabled ? null : onChanged),
    );
  }
}

Widget iconText(String text, IconData icon,
    {double spacing = 4.0,
    double iconSize = 18,
    double? fontSize,
    Function()? onClick}) {
  final child = Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(
        icon,
        size: iconSize,
      ),
      mX(spacing),
      Text(
        text,
        style: TextStyle(fontSize: fontSize),
      )
    ],
  );

  return onClick != null
      ? InkWell(onTap: onClick, enableFeedback: true, child: child)
      : child;
}

Widget tButton(String text,
    {double width = 150,
    double height = 35,
    double vp = 5,
    double hp = 10,
    void Function()? onClick,
    Widget? child}) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: vp, horizontal: hp),
          backgroundColor: btnBG,
          alignment: Alignment.center),
      child: child ?? Text(text),
    ),
  );
}
