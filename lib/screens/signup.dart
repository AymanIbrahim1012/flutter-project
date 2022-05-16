import 'package:flutterproject/screens/login.dart';
import 'package:flutterproject/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          child: ListView(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/3.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff6bceff),
                        Color(0xff6bceff)
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(90)
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.person,
                        size: 90,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 32,
                            right: 32
                        ),
                        child: Text('تسجيل حساب جديد',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 62),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width/1.2,
                        height: 45,
                        padding: EdgeInsets.only(
                            top: 4,left: 16, right: 16, bottom: 4
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(50)
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5
                            )
                          ],
                        ),
                        child: TextFormField(
                          controller: _nameController,
                          autocorrect: true,
                          maxLines: 1,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                            icon: Icon(Icons.person,
                              color: Color(0xff6bceff),
                            ),
                            hintText: 'أسم المستخدم',
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/1.2,
                        height: 45,
                        margin: EdgeInsets.only(top: 32),
                        padding: EdgeInsets.only(
                            top: 4,left: 16, right: 16, bottom: 4
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(50)
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5
                              )
                            ]
                        ),
                        child: TextFormField(
                          controller: _emailController,
                          autocorrect: true,
                          maxLines: 1,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                            icon: Icon(Icons.email_outlined,
                              color: Color(0xff6bceff),
                            ),
                            hintText: 'الايميل',
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/1.2,
                        height: 45,
                        margin:const EdgeInsets.only(top: 32),
                        padding:const EdgeInsets.only(
                            top: 4,left: 16, right: 16, bottom: 4
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(50)
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5
                              )
                            ]
                        ),
                        child: TextFormField(
                          controller: _passwordController,
                          autocorrect: true,
                          maxLines: 1,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration:const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                            icon: Icon(Icons.vpn_key,
                              color: Color(0xff6bceff),
                            ),
                            hintText: 'كلمة المرور',
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      // InkWell(
                      //   onTap: ()async{
                      //
                      //     DataBaseServices(
                      //         _emailController.text,
                      //         _nameController.text,
                      //       _passwordController.text,
                      //     ).addStudent().then((value) => ScaffoldMessenger.of(context).showSnackBar(
                      //       const  SnackBar(
                      //       content: Text('تم تسجيل الطالب بنجاح'),
                      //         backgroundColor: Colors.green,
                      //     )),
                      //     )
                      //         .catchError((onError)=> ScaffoldMessenger.of(context).showSnackBar(
                      //         const  SnackBar(
                      //           content: Text('حدث خطا'),
                      //           backgroundColor: Colors.red,
                      //         )));
                      //     _emailController.clear();
                      //     _nameController.clear();
                      //     _passwordController.clear();
                      //
                      //     // Navigator.pushReplacement(context,
                      //     // MaterialPageRoute(builder: (context)=>LoginPage(true))
                      //     // );
                      //   },
                      //   child: Container(
                      //     height: 45,
                      //     width: MediaQuery.of(context).size.width/1.2,
                      //     decoration:const BoxDecoration(
                      //         gradient: LinearGradient(
                      //           colors: [
                      //             Color(0xff6bceff),
                      //             Color(0xFF00abff),
                      //           ],
                      //         ),
                      //         borderRadius: BorderRadius.all(
                      //             Radius.circular(50)
                      //         )
                      //     ),
                      //     child: Center(
                      //       child: Text('تسجيل حساب جديد'.toUpperCase(),
                      //         style:const TextStyle(
                      //             color: Colors.white,
                      //             fontWeight: FontWeight.bold
                      //         ),g
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),

              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("هل لديك حساب ؟"),
                    SizedBox(width: 5,),
                    Text("تسجيل دخول",style: TextStyle(color: Color(0xff6bceff)),),
                  ],
                ),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
            ],

          ),
        ),
      ),
    );
  }
  void showInSnackBar(String value) {
    Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(value)
    ));
  }
}