import 'package:flutterproject/widgets/customeAppBarr.dart';
import 'package:flutter/material.dart';

class AdviserChatPage extends StatefulWidget {
  const AdviserChatPage({Key? key}) : super(key: key);

  @override
  _AdviserChatPageState createState() => _AdviserChatPageState();
}

class _AdviserChatPageState extends State<AdviserChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeAppBarr(title: 'محادثة مباشرة مع المرشدة'),
    );
  }
}
