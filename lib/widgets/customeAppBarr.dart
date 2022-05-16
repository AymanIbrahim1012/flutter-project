import 'package:flutter/material.dart';

AppBar customeAppBarr({
  String? title,
  double  size = 28 ,
  bool automaticallyImplyLeading = true,
  Widget? leading
}) {
  return AppBar(
    leadingWidth: 50,
    automaticallyImplyLeading: automaticallyImplyLeading,
    leading: leading,
    title:  Text(title!,
      style:  TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold
    ),),
    backgroundColor:const Color(0xff027e82),
    elevation: 0,
    centerTitle: true,
  );
}
