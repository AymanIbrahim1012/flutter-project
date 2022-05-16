import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/customeAppBarr.dart';
import '../../widgets/customeContainer.dart';
class HomeStudentPage extends StatelessWidget {
  const HomeStudentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: customeAppBarr(title: 'الطالب',),
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
                    title: 'تعديل الجدول',
                onTap: (){
                      // must Navigator in option an order {..}
                  Navigator.pushNamed(context, '/chooseType');
                }
                ),
                customContaner(
                    title: 'الخطة الدراسية',
                    onTap: (){
                      // must Navigator in option an order {..}
                      Navigator.pushNamed(context, '/studyPlanPage');
                    }
                ),
                customContaner(
                    title: 'تواصل مع مرشد  ',
                    onTap: (){
                      // must Navigator in option an order {..}
                      Navigator.pushNamed(context, '/chatScreen');
                    }
                    ),
                customContaner(
                    title:'الاعدادات  ',
                    onTap: (){
                      // must Navigator in option an order {..}
                      Navigator.pushNamed(context, '/settingsPage');
                    }
                    ),
                // customContaner(
                //     title:'طلب فرصة استثنائية',
                //     onTap: (){
                //       // must Navigator in option an order {..}
                //       Navigator.pushNamed(context, '/requestAChance');
                //     }
                //     ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
