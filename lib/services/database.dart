import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DataBaseServices{
 // final String? uid ;
String? name;
String? id;
String? type;
String? universityMajor;
String? coursename;


DataBaseServices(this.name, this.id, this.type,this.universityMajor,this.coursename );
// DataBaseServices({this.uid});
  final firestoreInstance = FirebaseFirestore.instance;
  // object
  CollectionReference students = FirebaseFirestore.instance.collection('student');

  Future<void> addStudent() {
    // Call the user's CollectionReference to add a new user
    return students
        .add({
      'name':name,
      'id': id,
      'type': type, // John Doe
      'UniversityMajor': universityMajor, // Stokes and Sons
      'coursename': coursename
      // 42
    })
    //العملية تمت
        .then((value) =>  SnackBar(
      content: Text("Student AddFailed to add user"),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.black
    ))
    // اسنكشاف الخطا
        .catchError((error) =>  SnackBar(
      content: Text("Failed to add user"),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }

  //
  // CollectionReference _collectionRef =
  // FirebaseFirestore.instance.collection('collection');

  Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await students.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    print(allData);
  }
  // void setData() async{
  //   var firebaseUser = await FirebaseAuth.instance.currentUser;
  //   firestoreInstance.collection("users").doc(firebaseUser?.uid).collection("student").doc(firebaseUser?.uid).set(
  //       {
  //         "email" : email,
  //         "name" : email,
  //         "password" : password
  //       }).then((_){
  //     print("success!");
  //   });
  // }


  // Future addStudent(String username ,String email, int password)async{
  //   return await collection.doc(uid).set({
  //     'username': username,
  //     'email': email,
  //     'password': password
  //   });
  // }

// Send user an email for password reset

}

class DataBaseServicesTow{
 // final String? uid ;
String? name;
String? id;
String? type;
String? universityMajor;
String? coursename;


DataBaseServicesTow(this.name, this.id, this.type,this.universityMajor,this.coursename );
// DataBaseServices({this.uid});
  final firestoreInstance = FirebaseFirestore.instance;
  // object
  CollectionReference students = FirebaseFirestore.instance.collection('student2');

  Future<void> addStudent() {
    // Call the user's CollectionReference to add a new user
    return students
        .add({
      'name':name,
      'id': id,
      'type': type, // John Doe
      'UniversityMajor': universityMajor, // Stokes and Sons
      'coursename': coursename
      // 42
    })
    //العملية تمت
        .then((value) =>  SnackBar(
      content: Text("Student AddFailed to add user"),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.black
    ))
    // اسنكشاف الخطا
        .catchError((error) =>  SnackBar(
      content: Text("Failed to add user"),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }

  //
  // CollectionReference _collectionRef =
  // FirebaseFirestore.instance.collection('collection');


}