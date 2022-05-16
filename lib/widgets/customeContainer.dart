import 'package:flutter/material.dart';

Widget customContaner({
  String? title,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
          color: const Color(0xff027e82),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              blurRadius: 5
          )
        ]
      ),
      margin:const EdgeInsets.only(bottom: 30),
      child:  Padding(
        padding: const EdgeInsets.only(right: 16),
        child:  Text(title!,

          maxLines: 1,
          style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
          ),
        ),
      ),
      alignment: Alignment.centerRight,
    ),
  );
}
