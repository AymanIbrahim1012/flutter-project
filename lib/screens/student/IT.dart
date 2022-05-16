import 'package:flutterproject/widgets/customeAppBarr.dart';
import 'package:flutter/material.dart';

class IT extends StatelessWidget {
  const IT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeAppBarr(title: 'CS'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: InteractiveViewer(
            child: Column(
              children: [
                // forget the path png
                Image.asset('assets/IT1.png'),
                Divider(indent: 10, endIndent: 10),
                Image.asset('assets/IT2.png'),
                Divider(indent: 10, endIndent: 10),
                Image.asset('assets/IT3.png'),
                Divider(indent: 10, endIndent: 10),
                Image.asset('assets/IT4.png'),
                Divider(indent: 10, endIndent: 10),
                Image.asset('assets/IT5.png'),
                Divider(indent: 10, endIndent: 10),
                Image.asset('assets/IT6.png'),
                Divider(indent: 10, endIndent: 10),
                Image.asset('assets/IT7.png'),
                Divider(indent: 10, endIndent: 10),
                Image.asset('assets/IT8.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
