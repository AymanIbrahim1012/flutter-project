import 'package:flutter/material.dart';

import 'chat_student.dart';


class StudentNumberId extends StatefulWidget {
  const StudentNumberId({Key? key}) : super(key: key);

  @override
  State<StudentNumberId> createState() => _StudentNumberIdState();
}

class _StudentNumberIdState extends State<StudentNumberId> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('الرقم الجامعي للطالب',
          style:
          TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold
          ),),
        centerTitle: true,
        backgroundColor: const Color(0xff027e82),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize:const Size(double.infinity, 50),
          child: Container(
            color: const Color(0xff027e82),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 16 ,right: 16 , bottom: 20 ,top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 3,
                    color: Colors.white,
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.9,
                      height: 45,
                      margin: EdgeInsets.only(top: 20),
                      padding:const EdgeInsets.only(
                          top: 4,left: 16, right: 16, bottom: 4
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            width: 1
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8
                          )
                        ],
                      ),
                      child: TextFormField(
                        controller: _numberController,
                        autocorrect: true,
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        decoration:const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(0, 4, 0, 8),
                          // suffix:Icon(Icons.arrow_drop_down,
                          //   color: Color(0xff0e86c4),
                          // ) ,
                          suffixIcon:Icon(Icons.arrow_drop_down,color: Color(0xff0e86c4),size: 28) ,
                          hintText: '01254825',

                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Center(
                      child: Container(
                        height: 40,
                        width: 80,
                        margin: EdgeInsets.only(top: 15,bottom: 10),
                        decoration: BoxDecoration(
                            color:const Color(0xf23fc8ea),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child:const Text('بحث',style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),

                  const Spacer(),
                  InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> StudentChatPage())),
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                          color:const Color(0xf23fc8ea),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child:const Text('مراسلة',style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                          color:const Color(0xf23fc8ea),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child:const Text('رجوع',style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

