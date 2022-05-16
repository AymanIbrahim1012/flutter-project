import 'package:flutter/material.dart';

import '../../widgets/customeAppBarr.dart';

class GuideDataPage extends StatefulWidget {
  const GuideDataPage({Key? key}) : super(key: key);

  @override
  _GuideDataPageState createState() => _GuideDataPageState();
}

class _GuideDataPageState extends State<GuideDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeAppBarr(title: 'بيانات المرشده',),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15,right: 16 ,left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Text(' د.سارة البدر',
              //       style: TextStyle(
              //           fontSize: 28,
              //           fontWeight: FontWeight.bold
              //       ),
              //     ),
              //     Text(': اسم المرشدة',
              //     style: TextStyle(
              //       fontSize: 28,
              //       fontWeight: FontWeight.bold
              //     ),
              //     ),
              //
              //
              //   ],
              // ),
              Spacer(),
              InkWell(
                 onTap: () => Navigator.pushNamed(context, '/AdviserChatPage'),
                child: Container(
                  height: 40,
                  width: 80,
                  margin: EdgeInsets.only(top: 15,bottom: 10),
                  decoration: BoxDecoration(
                      color:const Color(0xff17c7ad),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child:const Text('مراسلة',style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              InkWell(
                 onTap: () => Navigator.pop(context),
                child: Container(
                  height: 40,
                  width: 80,
                  margin: EdgeInsets.only(top: 15,bottom: 10),
                  decoration: BoxDecoration(
                      color:const Color(0xff17c7ad),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child:const Text('رجوع',style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
