import 'package:flutter/material.dart';

import '../../widgets/customeAppBarr.dart';
class IS extends StatelessWidget {
  const IS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customeAppBarr(title: 'IS'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: InteractiveViewer(
            child: Column(
              children: [
                // forget the path png
                Image.asset('assets/Is1.png'),
                Divider(indent: 10, endIndent: 10),
                Image.asset('assets/IS2.png'),
                Divider(indent: 10, endIndent: 10),
                Image.asset('assets/IS3.png'),
                Divider(indent: 10, endIndent: 10),
                Image.asset('assets/IS4.png'),
                Divider(indent: 10, endIndent: 10),
                Image.asset('assets/IS5.png'),
                Divider(indent: 10, endIndent: 10),
                Image.asset('assets/IS6.png'),
                Divider(indent: 10, endIndent: 10),
                Image.asset('assets/IS7.png'),
                Divider(indent: 10, endIndent: 10),
                Image.asset('assets/IS8.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
