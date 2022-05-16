import 'package:flutterproject/widgets/customeAppBarr.dart';
import 'package:flutter/material.dart';

class StudentChatPage extends StatefulWidget {
  const StudentChatPage({Key? key}) : super(key: key);

  @override
  _StudentChatPageState createState() => _StudentChatPageState();
}

class _StudentChatPageState extends State<StudentChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeAppBarr(title: 'محادثة مباشرة مع الطالب'),
    );
  }
}
