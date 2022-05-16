import 'package:flutterproject/widgets/customeAppBarr.dart';
import 'package:flutter/material.dart';
class CS extends StatelessWidget {
  const CS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customeAppBarr(title: 'CS'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: InteractiveViewer(
            child: Column(
              children: [
                // forget the path png
                Image.asset('assets/CS1.png'),
                Divider(indent: 10, endIndent: 10),
                Image.asset('assets/CS2.png'),
                Divider(indent: 10, endIndent: 10),
                Image.asset('assets/CS3.png'),
                Divider(indent: 10, endIndent: 10),
                Image.asset('assets/CS4.png'),
                Divider(indent: 10, endIndent: 10),
                Image.asset('assets/CS5.png'),
                Divider(indent: 10, endIndent: 10),
                Image.asset('assets/CS6.png'),
                Divider(indent: 10, endIndent: 10),
                Image.asset('assets/CS7.png'),
                Divider(indent: 10, endIndent: 10),
                Image.asset('assets/CS8.png'),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
