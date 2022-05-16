import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {

    super.initState();
   // getData();
    getData();
  }
  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('student');
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
      appBar: AppBar(
          automaticallyImplyLeading: false,
        backgroundColor: Color(0xff6bceff),
        title: Text("قائمة الطلاب"),
        centerTitle: true,
      ),
      body: Center(
        // بترجع قيمة اكتر من مرة
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('student').snapshots(),
          builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
          //  snapshot.hasData
            if (!snapshot.hasData) return  LinearProgressIndicator();
            return ListView(children: getStudent(snapshot));
            // return ListView(
            //   children: snapshot.data!.docs.map((value) {
            //     return Center(
            //       child: ListTile(
            //         title: InkWell(
            //             onTap: () {
            //             },
            //             child: Text('dvd')
            //         ),
            //       ),
            //     );
            //   }).toList(),
            // );
          },
        ),
      ),

    );

}

  getStudent(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data?.docs
        .map((doc) =>  ListTile(title:  Text(doc["id"].toString()), subtitle:  Text(doc["type"].toString()),

    ))
        .toList();
  }
}
// class User{
//   String? name;
//
//   User(this.name);
//
//   factory User.fromDocument(DocumentSnapshot doc) {
//     return User(
//       name: doc.data()['id'],
//     );
//   }
// }
