import 'package:flutterproject/widgets/customeAppBarr.dart';
import 'package:flutter/material.dart';

class RequestInProgress extends StatelessWidget {
  const RequestInProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeAppBarr(
          title: 'تم استلام طلبك وهو قيد التنفيذ',
          size: 22,
          automaticallyImplyLeading: false),
      body: Container(
        width:double.infinity,
        height:double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 20,left: 16 ,right: 16 ,bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 40,
                      width: 80,
                      margin:const EdgeInsets.only(top: 15,bottom: 10),
                      decoration: BoxDecoration(
                          color:const Color(0xf23fc8ea),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child:const Text('رجوع',style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
