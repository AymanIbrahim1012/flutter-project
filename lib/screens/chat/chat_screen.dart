import 'package:flutterproject/widgets/customeAppBarr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


final _firestore = FirebaseFirestore.instance;
late User signedInUser ;

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final messageTextController =TextEditingController();
  final _auth = FirebaseAuth.instance ;
  String? messageText = null ;
  bool? isEnable;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void getCurrentUser(){
    try{
      final user = _auth.currentUser;
      if(user != null){
        signedInUser = user ;
        print(signedInUser.email);
      }
    }catch(e){
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();

  }
  // void getMesseges() async{
  //  final messeges =  await _firestore.collection('messages').get();
  //  for (var message in messeges.docs){
  //    print(message.data());
  //  }
  // }

  void messagesStreams()async{
    await for(var snapshot in _firestore.collection('messages').snapshots()){
      for(var message in snapshot.docs ){
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customeAppBarr(title: 'صفحة المحادثة'),
      // backgroundColor: Color(0xff0097DA),
      // title: Row(
      //   children: [
      //     Image.asset('assets/logo.png', height: 25),
      //     SizedBox(width: 10),
      //     Text('MessageMe')
      //   ],
      // ),
      // actions: [
      //   IconButton(
      //     onPressed: () {
      //       // add here logout function
      //       // messagesStreams();
      //       _auth.signOut();
      //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Login()));
      //     },
      //     icon: Icon(Icons.close),
      //   )
      // ],

      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MessageStreamBuilder(),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Color(0xff0097DA),
                      width: 2,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: messageTextController,
                        maxLines: 1,
                        validator: (value){

                        },
                        onChanged: (value) {
                          messageText = value ;
                          setState(() {
                            isEnable = true;
                          });
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          hintText: '... اكتب رسالتك هنا  ',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                       TextButton(
                      onPressed: () {
                        if(messageText == null){
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('ادخل نص'),
                            backgroundColor: Colors.pinkAccent,
                            duration: Duration(seconds: 1),
                          ));
                        }else{
                          messageTextController.clear();
                          _firestore.collection('messages').add({
                            'sender': signedInUser.email ,
                            'text': messageText,
                            'time': FieldValue.serverTimestamp(),
                          });
                          print(messageText);
                          print(signedInUser.email);
                          messageText = null;
                          setState(() {
                            isEnable = false;
                          });
                        }

                      },
                           child: Icon(Icons.send,color: Colors.blue.shade700,)
                      // Text(
                      //   'send',
                      //   style: TextStyle(
                      //     color: Colors.blue[800],
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 18,
                      //   ),
                      // ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class MessageStreamBuilder extends StatelessWidget {
  const MessageStreamBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection("messages").orderBy('time').snapshots(),
      builder: (context , snapshot){
        List<MessageLine> messageWidgets = [];
        if(!snapshot.hasData){
          // add here a spinner
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data!.docs;
        for(var message in messages){
          final messageText = message.get('text');
          final messageSender = message.get('sender');
          final currentUser = signedInUser.email;

          final messageWidget = MessageLine(
            messageSender,
            messageText,
            currentUser == messageSender,
          );


          messageWidgets.add(messageWidget);
        }
        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 20),
            children: messageWidgets,
          ),
        );
      },
    );
  }
}


class MessageLine extends StatelessWidget {
  const MessageLine(this.sender, this.text , @required this.isMe ,{Key? key}) : super(key: key);

  final String? sender ;
  final String? text ;
  final bool isMe ;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [

          Material(
            elevation: 5,
            borderRadius: isMe ? BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ) : BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),

            color: isMe? Colors.green : Colors.black38,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
              child: Text("$text",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),

          SizedBox(height: 2,),
          Text('$sender',
              style: TextStyle(fontSize: 10 ,color: Colors.black54))
        ],
      ),
    );
  }
}
