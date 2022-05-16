import 'package:flutterproject/screens/student/home_screen.dart';
import 'package:flutterproject/screens/student/settings_screen.dart';
import 'package:flutterproject/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'adviser/home_adviser_screen.dart';
import 'manger/home_screen.dart';

class LoginPage extends StatefulWidget {
   bool? isStud;
  bool? isManger;
   bool? isAdviser;

  LoginPage({Key? key,   this.isStud , this.isAdviser, this.isManger}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailResetController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  bool _isLogin = true;
  late String email;

  late String password;
  bool showSpinner = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _emailResetController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Future<void> login() async {
  //   FirebaseFirestore.instance.collection('student').where('name').get();
  //
  //   FirebaseFirestore.instance
  //       .collection('student')
  //       .where('email', isEqualTo: _emailController.text)
  //       .get()
  //       .then((value) =>
  //           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //             content: Text('الطالب  موجود'),
  //             backgroundColor: Colors.green,
  //           )));
  //
  // }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(
            child: ListView(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3.5,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff44d7db),
                        Color(0xff027e82)],
                    ),
                    // borderRadius: BorderRadius.only(
                    //     bottomLeft: Radius.circular(90)
                    // )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: [
                          Spacer(),
                          IconButton(onPressed: () {
                            Navigator.pushNamed(context, '/welcome');
                          }, icon: Icon(Icons.arrow_back,textDirection: TextDirection.ltr,)),
                        ],
                      ),
                      Spacer(),
                     const Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.person,
                          size: 90,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10, right: 32),
                          child: Text(
                            'SignIn',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10, right: 32),
                          child: Text(
                            'تسجيل الدخول',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 62),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 45,
                          padding: const EdgeInsets.only(
                              top: 0, left: 0, right: 16, bottom: 0),
                          decoration: const BoxDecoration(

                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5)
                            ],
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            autocorrect: true,
                            maxLines: 1,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !value.contains('@') ||
                                  !value.contains('.com')) {
                                return "ادخل ايميل بشكل صحيح";
                              }else if(widget.isStud == true && !value.contains('stu')){
                                return "يجب تسجيل الدخول كطالب";

                              }else if(widget.isAdviser == true && !value.contains('adv')){
                                return "يجب تسجيل الدخول ك مرشدة";

                              }else if(widget.isManger == true && !value.contains('man')){
                                return "يجب تسجيل الدخول ك رئيس قسم";

                              }
                              return null;


                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, -5),
                              icon: Icon(
                                Icons.person,
                                color: Color(0xff027e82),
                              ),
                              hintText: 'الايميل',
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 45,
                          margin: const EdgeInsets.only(top: 32),
                          padding: const EdgeInsets.only(
                              top: 4, left: 16, right: 16, bottom: 4),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 5)
                              ]),
                          child: TextFormField(

                            controller: _passwordController,
                            autocorrect: true,
                            maxLines: 1,
                            validator: (value) {
                              if (value == null || value.length < 6) {
                                return "كلمة المرور على الافل 6 حروف";
                              }
                              return null;
                            },
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, -5),
                              icon: Icon(
                                Icons.vpn_key,
                                color: Color(0xff027e82),
                              ),
                              hintText: 'كلمة المرور',
                            ),
                          ),
                        ),
                         Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 16, right: 32),
                            child: InkWell(
                              onTap: () {
                                showAlertDialog(context);
                              },
                              child:const Text(
                                'نسيت كلمة المرور ؟',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () async {
                           await signIn();
                          },
                          child: Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width / 1.2,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff48d0d4),
                                    Color(0xff027e82),
                                  ],
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: Center(
                              child: Text(
                                'تسجيل الدخول'.toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
  Future signIn() async{

    setState(() {
      showSpinner = false ;
    });
    if (_formKey.currentState!.validate()) {
      try {
        _firebaseAuth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        ).then((value) {
          _emailController.clear();
          _emailController.clear();
          setState(() {
            showSpinner = false ;
          });
          widget.isStud! ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeStudentPage()))
              :widget.isAdviser! ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeAdviserPage()))
              :Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FollowUpAdviserRequests()));

          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(
            content: Text('تم تسجيل الدخول بنجاح'),
            backgroundColor: Colors.green,
          ));
        },onError:(e){
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(
            content: Text('خطأ بالايميل او كلمة المرور'),
            backgroundColor: Colors.red,
          ));
        });

      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(
            content: Text('المستخدم غير موجود'),
            backgroundColor: Colors.red,
          ));
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(
            content: Text('حطا في كلمة المرور'),
            backgroundColor: Colors.red,
          ));
        } else if (e.code == 'ERROR_USER_NOT_FOUND') {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(
            content: Text('ايميل المستحدم غير موجود'),
            backgroundColor: Colors.red,
          ));
        }
      }
    }
  }
  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("رجوع"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("ارسال كلمة المرور"),
      onPressed:  ()async {
            try{
              if(_formKey2.currentState!.validate()){

                await _firebaseAuth.sendPasswordResetEmail(email: _emailResetController.text.trim()).then((value) => ScaffoldMessenger.of(context).showSnackBar(
                    const  SnackBar(
                      content: Text('تفقد ايميلك'),
                      backgroundColor: Colors.green,

                    ),),
                );
                Navigator.pop(context);
              }

            } on FirebaseAuthException catch(e){
              if (e.code == 'user-not-found') {
                print('No user found for that email.');
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(
                  content: Text('المستخدم غير موجود'),
                  backgroundColor: Colors.red,
                ));
              } else if (e.code == 'wrong-password') {
                print('Wrong password provided for that user.');
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(
                  content: Text('حطا في كلمة المرور'),
                  backgroundColor: Colors.red,
                ));
              } else if (e.code == 'ERROR_USER_NOT_FOUND') {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(
                  content: Text('ايميل المستحدم غير موجود'),
                  backgroundColor: Colors.red,
                ));
              }
            }

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title:const Text("استرجاع كلمة المرور",textDirection: TextDirection.rtl),
      content:Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: 45,
        padding: const EdgeInsets.only(
            top: 0, left: 0, right: 16, bottom: 0),
        decoration: const BoxDecoration(

          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 5)
          ],
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Form(
            key: _formKey2,
            child: TextFormField(
              controller: _emailResetController,
              autocorrect: true,
              maxLines: 1,
              validator: (value) {
                if (value!.isEmpty ||
                    !value.contains('@') ||
                    !value.contains('.com')) {
                  return "ادخل ايميل بشكل صحيح";
                }else if(widget.isStud == true && !value.contains('com')){
                  return "يجب تسجيل الدخول كطالب";

                }else if(widget.isAdviser == true && !value.contains('adv')){
                  return "يجب تسجيل الدخول ك مرشدة";

                }else if(widget.isManger == true && !value.contains('man')){
                  return "يجب تسجيل الدخول ك رئيس قسم";

                }
                return null;


              },
              keyboardType: TextInputType.emailAddress,

              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(0, 0, -10, -5),
                icon: Icon(
                  Icons.person,
                  color: Color(0xff6bceff),
                ),
                hintText: 'أدخل الايميل',
              ),
            ),
          ),
        ),
      ),
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
  }}
