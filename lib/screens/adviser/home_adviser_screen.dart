import 'package:flutterproject/screens/adviser/student_requests_screen.dart';
import 'package:flutterproject/screens/adviser/stusent_number.dart';
import 'package:flutterproject/screens/chat/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/customeAppBarr.dart';
import '../../widgets/customeContainer.dart';
import 'chat_student.dart';

class HomeAdviserPage extends StatelessWidget {
  const HomeAdviserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeAppBarr(title: 'المرشده',
      automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body:  SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16,top: 30),
          child: SingleChildScrollView(
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customContaner(
                    title: 'متابعة طلبات الطلاب   ',
                    onTap: (){
                      // must Navigator in option an order {..}
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> StudentNumberId()));
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> FollowUpStudentRequests()));
                    }
                ),
                customContaner(
                    title: 'تواصل مع طالب ',
                    onTap: (){
                      // must Navigator in option an order {..}
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatScreen()));
                    }
                ),
                customContaner(
                    title:'الاعدادات  ',
                    onTap: (){
                      // must Navigator in option an order {..}
                      Navigator.pushNamed(context, '/settingsPage');
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
