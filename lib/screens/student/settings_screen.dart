import 'package:flutterproject/widgets/customeAppBarr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _passwordController1 = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values); //add this line
    return Scaffold(
      appBar: customeAppBarr(title: 'الاعدادات',
          // leading: InkWell(
          //   onTap: () async {
          //     showAlertDialog(context);
          //   },
          //   child: Container(
          //     margin: EdgeInsets.all(5),
          //
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(70),
          //         color: Colors.white
          //     ),
          //     child: Icon(
          //       Icons.logout,size: 20,textDirection:TextDirection.rtl,color: Colors.redAccent,
          //     ),
          //   ),
          // )

      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 10 ,right: 20),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15,),
                    Text('* تغيير كلمة المرور',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ) ,),
                    SizedBox(height: 40,),
                    Text('كلمة المرور الحالية',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: 45,
                      margin:const EdgeInsets.only(top: 10,bottom: 25),
                      padding:const EdgeInsets.only(
                          top: 4,left: 16, right: 16, bottom: 4
                      ),
                      decoration:const BoxDecoration(
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
                        controller: _passwordController1,
                        autocorrect: true,
                        maxLines: 1,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return "كلمة المرور على الافل 6 حروف";
                          }
                          return null;
                        },
                        decoration:const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          icon: Icon(Icons.vpn_key,
                            color: Color(0xff027e82),
                          ),
                          hintText: 'كلمة المرور الحالية',
                        ),
                      ),
                    ),
                    Text('كلمة المرور الجديدة',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),),
                    Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: 45,
                      margin:const EdgeInsets.only(top: 10,bottom:25 ),
                      padding:const EdgeInsets.only(
                          top: 4,left: 16, right: 16, bottom: 4
                      ),
                      decoration:const BoxDecoration(
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
                        controller: _passwordController2,
                        autocorrect: true,
                        maxLines: 1,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return "كلمة المرور على الافل 6 حروف";
                          }
                          return null;
                        },
                        decoration:const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          icon: Icon(Icons.vpn_key,
                            color: Color(0xff027e82),
                          ),
                          hintText: 'كلمة المرور الجديدة',
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    InkWell(
                      onTap: () async {
                        if(_formKey.currentState!.validate()){
                          _changePassword(_passwordController1.text, _passwordController2.text);

                        }
                      },
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff20dbe2),
                                Color(0xff027e82),
                              ],
                            ),
                            borderRadius:
                            BorderRadius.all(Radius.circular(50))),
                        child: Center(
                          child: Text(
                            'حفظ كلمة المرور'.toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    const Text('* تواصل معنا',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      ) ,),
                    // InkWell(
                    //   onTap: () => Navigator.pop(context),
                    //   child: Container(
                    //     height: 40,
                    //     width: 80,
                    //     margin:const EdgeInsets.only(top: 15,bottom: 10),
                    //     decoration: BoxDecoration(
                    //         color:const Color(0xf23fc8ea),
                    //         borderRadius: BorderRadius.circular(20)
                    //     ),
                    //     child:const Text('رجوع',style: TextStyle(
                    //       color: Colors.white,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 22,
                    //     ),
                    //       textAlign: TextAlign.center,
                    //     ),
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () async{
                            String url_facebook = 'https://ar-ar.facebook.com/PNUKSA0/';
                            if (!await launch(url_facebook,)) throw 'Could not launch $url_facebook';
                          },
                          icon:Icon(Ionicons.logo_facebook) ,iconSize: 35,color: Colors.blue,),
                        SizedBox(width: 15,),
                        IconButton(
                            onPressed: () async{
                              String url_twitter = 'https://twitter.com/_pnu_ksa?s=21';
                              if (!await launch(url_twitter,)) throw 'Could not launch $url_twitter';
                            }, icon:Icon(Ionicons.logo_twitter),iconSize:35 ,color: Colors.blue.shade700),
                        SizedBox(width: 15,),
                        IconButton(
                            onPressed: () async{
                              String url_insta = 'https://instagram.com/_pnu_ksa?utm_medium=copy_link';
                              if (!await launch(url_insta,)) throw 'Could not launch $url_insta';
                            }, icon:Icon(Ionicons.logo_instagram),iconSize:35 ,color: Colors.pinkAccent),
                        SizedBox(width: 15,),
                        IconButton(
                            onPressed: () async{
                              String url_linked = 'https://www.linkedin.com/school/princess-nourah-bint-abdulrahman-university';
                              if (!await launch(url_linked,)) throw 'Could not launch $url_linked';
                            }, icon:Icon(Ionicons.logo_linkedin),iconSize:35 ,color: Colors.blue.shade900),
                        SizedBox(width: 15,),
                        IconButton(
                            onPressed: () async{
                              String url_mail = 'mailto:info@pnu.edu.sa';
                              if (!await launch(url_mail,)) throw 'Could not launch $url_mail';
                            }, icon:Icon(Ionicons.mail_open_outline),iconSize:35 ,color: Colors.blue.shade900),

                      ],
                    ),
                    SizedBox(height: 50,),
                    InkWell(
                      onTap: () async {
                      await  showAlertDialog(context);
                      },
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xffdb0f0f),
                                Color(0xff9a073b),
                              ],
                            ),
                            borderRadius:
                            BorderRadius.all(Radius.circular(50))),
                        child: Center(
                          child: Text(
                            'تسجيل الخروج'.toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _changePassword(String currentPassword, String newPassword) async {
    final user = await FirebaseAuth.instance.currentUser;
    final cred = EmailAuthProvider.credential(
        email: user!.email.toString(), password: currentPassword.trim());

    user.reauthenticateWithCredential(cred).then((value) {
      user.updatePassword(newPassword).then((_) {
        print('Success');
        _passwordController1.clear();
        _passwordController2.clear();
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(
          content: Text('تم تغير كلمة المرور'),
          backgroundColor: Colors.green,
        ));
        //Success, do something
      }).catchError((error) {
        //Error, show something
        print('Error newPassword');
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(
          content: Text('حدث حطا ما..!'),
          backgroundColor: Colors.red,
        ));
      });
    }).catchError((err) {
      print('Error currentPassword');
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(
        content: Text('كلمة المرور الحالية غير صحيحة'),
        backgroundColor: Colors.red,
      ));
    });}

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
