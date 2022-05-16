import 'dart:async';
import 'package:flutterproject/screens/login.dart';
import 'package:flutterproject/screens/student/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    Timer( Duration(seconds: 4), ()async {
              if ( _firebaseAuth.currentUser !=null && _firebaseAuth.currentUser!.email.toString().contains('stu') ) {
                Navigator.pushReplacementNamed(context, '/HomeStudentPage');
              }else if (_firebaseAuth.currentUser != null && _firebaseAuth.currentUser!.email.toString().contains('adv') ) {
                  Navigator.pushReplacementNamed(context, '/homeAdviserPage');
                } else if (_firebaseAuth.currentUser != null &&
                  _firebaseAuth.currentUser!.email.toString().contains('man')) {
                  Navigator.pushReplacementNamed(context, '/followUpAdviserRequests');
                } else {
                  Navigator.pushReplacementNamed(context,'/welcome');

                }
            }
            );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body:Center(child: Image.asset('assets/logo.png'))
    );
  }
}
