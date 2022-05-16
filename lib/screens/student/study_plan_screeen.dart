import 'package:flutterproject/widgets/customeAppBarr.dart';
import 'package:flutter/material.dart';

class StudyPlanPage extends StatefulWidget {
  const StudyPlanPage({Key? key}) : super(key: key);

  @override
  _StudyPlanPageState createState() => _StudyPlanPageState();
}

class _StudyPlanPageState extends State<StudyPlanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeAppBarr(title: 'الخطة الدراسية'),
      backgroundColor: Colors.grey.shade100,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/IT");
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: const Color(0xff027e82),
                    borderRadius: BorderRadius.circular(25)),
                child:const Center(
                  child: Text(
                    'IT',
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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/IS");
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: const Color(0xff027e82),
                    borderRadius: BorderRadius.circular(25)),
                child:const Center(
                  child: Text(
                    'IS',
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
            GestureDetector(
              onTap: () {
               Navigator.pushNamed(context, "/CS");
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: const Color(0xff027e82),
                    borderRadius: BorderRadius.circular(25)),
                child:const Center(
                  child: Text(
                    'CS',
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
