import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterproject/screens/login.dart';
import 'package:flutterproject/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class WelcomePage extends StatefulWidget {
   WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor:const Color(0xff027e82),
        title:const Text('تسجيل الدخول',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
      ),
      backgroundColor:const Color(0xff027e82),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              GestureDetector(
                onTap: ()async {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage(isAdviser: true,isManger: false,isStud: false,)));

                },
                child: Container(
                  height: 100,
                  width: 160,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(25)),
                  child:const Center(
                    child: Text(
                      ' مرشد أكاديمي',
                      textAlign: TextAlign.center,
                       style: TextStyle(
                         fontSize: 24,
                         fontWeight: FontWeight.bold,
                         color: Colors.white
                       ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
            GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage(isStud: true,isAdviser: false,isManger: false,)));

                },
                child: Container(
                  height: 100,
                  width: 160,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(25)),
                  child:const Center(
                    child: Text(
                      'طالب',
                      textAlign: TextAlign.center,
                       style: TextStyle(
                         fontSize: 24,
                         fontWeight: FontWeight.bold,
                         color: Colors.white
                       ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
            GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage(isManger: true,isStud: false,isAdviser: false,)));
                },
                child: Container(
                  height: 100,
                  width: 160,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(25)),
                  child:const Center(
                    child: Text(
                      'رئيسة القسم',
                      textAlign: TextAlign.center,
                       style: TextStyle(
                         fontSize: 24,
                         fontWeight: FontWeight.bold,
                         color: Colors.white
                       ),
                    ),
                  ),
                ),
              ),

          ],
        ),
      ),
    );
  }
}
