import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/utils/functions.dart';

import 'package:window_manager/window_manager.dart';

import '../stores/app.dart';


Widget MobileTitleBar(AppStore appStore){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Builder(
          builder: (context) {
            return IconButton(onPressed: (){
              showModalBottomSheet(context: context, builder: (
                  BuildContext context){
                return Container();
              },
              );
            }, icon: const Icon(CupertinoIcons.bars));
          }
      ),
      Text( appStore.title, style: const TextStyle(fontSize: 16),),
      Row(
        //id=actions
        children: [
          IconButton(onPressed: (){},
              icon: const Icon(CupertinoIcons.ellipsis_vertical)),
        ],
      )
    ],
  );
}

Widget DesktopTitleBar(AppStore appStore){

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Builder(
          builder: (context) {
            return IconButton(onPressed: (){
              showModalBottomSheet(context: context, builder: (
                  BuildContext context){
                return Container();
              },
              );
            }, icon: const Icon(CupertinoIcons.bars));
          }
      ),
      Text(appStore.title, style: const TextStyle(fontSize: 16),),
      Row(
        //id=actions
        children: [
         ActionBtn(CupertinoIcons.minus_circle_fill, color: Colors.yellow, onClick: ()async{
           await windowManager.minimize();
         }),
         ActionBtn(CupertinoIcons.add_circled_solid, color: Colors.green, onClick: ()async{
           if (await windowManager.isMaximized()) {
             await windowManager.unmaximize();
           }
           else{
             await windowManager.maximize();
           }
         }),
         ActionBtn(CupertinoIcons.multiply_circle_fill, color: Colors.red, onClick: ()async{
           await windowManager.close();
         }),
        ],
      )
    ],
  );
}

Widget ActionBtn(IconData icon, {Color? color, void Function()? onClick}){

  const double iconSize = 16;
  return Container(
    width: 35,
    height: 35,
    child: InkWell(
      mouseCursor: SystemMouseCursors.basic,
      enableFeedback: true,
      onTap: onClick,
      onTapDown: (e){
        clog("ontap");
      },
      child: Icon(icon, size: iconSize, color: color,),
    ),
  );
}