import 'package:flutter/material.dart';

import '../widgets/customeAppBarr.dart';

class RequestAChance extends StatelessWidget {
  const RequestAChance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: customeAppBarr(title: 'فرصة استثنائية'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/requestInProgress'),
                child: Container(
                  height: 140,
                  width: 120,
                  margin:const EdgeInsets.only(top: 40,bottom: 10),
                  decoration: BoxDecoration(
                      color:const Color(0xf23fc8ea),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child:const Text('طلب\n فرصة استثنائية' ,style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Spacer(),
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
