import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/utils/constants.dart';
import '/widgets/common.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize(context).width -  bottomBarH,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          Text("Home Page"),
        ],
      ),
    );
  }
}
