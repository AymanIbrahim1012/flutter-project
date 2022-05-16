import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterproject/widgets/customeAppBarr.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../services/database.dart';

class FollowUpAdviserRequests extends StatefulWidget {
  const FollowUpAdviserRequests({Key? key}) : super(key: key);

  @override
  _FollowUpAdviserRequestsState createState() =>
      _FollowUpAdviserRequestsState();
}

class _FollowUpAdviserRequestsState extends State<FollowUpAdviserRequests> {
  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('student2');

  Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    print(allData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeAppBarr(title: 'طلبات الطلاب',
      automaticallyImplyLeading: false,
      leading: IconButton(onPressed: () async {
        showAlertDialog(context);
      }, icon: Icon(Icons.logout,color: Colors.red,))
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
            stream:
            FirebaseFirestore.instance.collection('student2').snapshots(),
            builder:
            // you shoude add QuerySnapshot
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData)
                return const Center(child: Text("لا يوجد طلبات"));
              return ListView(children: getStudentRequst(snapshot));
            }),
      ),
    );
  }

  getId(String id) {
    var ref = FirebaseFirestore.instance
        .collection('student')
        .where("id", isEqualTo: id)
        .get();
    ref.then((v) => print(v.docs[0].id));
    print(id);
  }

  getStudentRequst(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data?.docs
        .map((doc) => Card(
      elevation: 2,
      shadowColor: Colors.black,
      margin: EdgeInsets.all(17),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Text(" : اسم الطالب "),
                Text(doc["name"]),
              ],
            ),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Text(" :  رقم الطالب "),
                Text(doc["id"]),
              ],
            ),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Text(" :  نوع الطلب "),
                Text(doc["type"]),
              ],
            ),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Text(" :   التخصص "),
                Text(doc["UniversityMajor"]),
              ],
            ),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Text(" : اسم المقرر "),
                Text(doc["coursename"]),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 1,
                  color: Colors.black,
                  height: 50,
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection("student2")..where("id", isEqualTo : doc['id'] )
                        .get().then((value){
                      value.docs.forEach((element) {
                        FirebaseFirestore.instance.collection("student2").doc(element.id).delete().then((value){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('تم الحذف'),
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                        }).catchError((onError) => ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('حدث حطا ما'),
                            backgroundColor: Colors.green,
                          ),
                        ));
                      });
                    });
                  },
                  icon: Icon(Icons.highlight_remove),
                  color: Colors.red,
                  iconSize: 26,
                ),
              ],
            )
          ],
        ),
      ),
    ))
        .toList();
  }
  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("الغاء",style: TextStyle(color: Colors.green)),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("تسجيل خروج" ,style: TextStyle(color: Colors.red),),
      onPressed:  () async {
        await FirebaseAuth.instance.signOut().then((value) => Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false));

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("هل تريد تسجيل الخروج"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
