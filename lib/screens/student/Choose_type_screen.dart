import 'package:flutterproject/widgets/customeAppBarr.dart';
import 'package:flutter/material.dart';

import '../../services/database.dart';

class ChooseType extends StatefulWidget {
  const ChooseType({Key? key}) : super(key: key);

  @override
  State<ChooseType> createState() => _ChooseTypeState();
}

class _ChooseTypeState extends State<ChooseType> {
  int _radioValue = 0;
  String dropdownvalue = 'حذف';
  String dropdownvalue2 = 'IT';
  String dropdownvalue3 = 'MATH 103T';
  var itemsType = [
    'حذف',
    'اضافة',
    'تعديل',
  ];
  var coursename = [
    'MATH 103T',
    'MATH 367T',
    'PHYS 101T',
    'IT 201T',
    'IT 222T',
    'IT 311T',
    'IT 481T',
    'IT 371T',
    'IT 361T',
    'IT 435T',
    'IT 436T',
    'IT 437T',
    'IT 426T',
    'IT 331T',
    'IT 324T',
    'IT 341T',
    'IT 432T',
    'IT 433T',
    'IT 425T',
    'IT 434T',
    'IT 351T',
    'IT 352T',
    'IT 432T',
    'IT 433T',
    'IT 351T',
    'IT 434T',
    'IT 351T',
    'IT 352T',
    'IT 353T',
    'IT 414T',
    'IT 412T',
    'IT 415T',
    'IT 413T',
    'IT 416T',
    'IT 417',
    'CS 385T',
    'CS 350T',
    'CS 220T',
    'CS 105T',
    'CS 206T',
    'IS 130T',
    'IS 322T',
    'IS 231T',
    'IS 332T',
    'IS 233T',
    'IS 234T',
    'IS 221T',
    'IS 435T',
    'IS 221T',
    'IS 323T',
    'IS 410T',
    'BUS 101',
    'BUS 253',
    'ACCT 201',
  ];
  var itemsUniversityMajor = [
    'IT',
    'IS',
    'CS',
  ];

// make value is nullable
  void handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value!;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customeAppBarr(title: 'اختيار نوع الطلب'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding:
              const EdgeInsets.only(right: 30, bottom: 20, top: 15, left: 30),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //
                  //   children: [
                  //    const Text(
                  //       'حذف',
                  //       style:  TextStyle(fontSize: 16.0,),
                  //      textAlign: TextAlign.end,
                  //     ),
                  //   //  SizedBox(width: 10,),
                  //     Radio(
                  //       value: 0,
                  //       groupValue: _radioValue,
                  //       onChanged: handleRadioValueChange,
                  //     ),
                  //   ],
                  // ),
                  //  Row(
                  //    mainAxisAlignment: MainAxisAlignment.end,
                  //    crossAxisAlignment: CrossAxisAlignment.center,
                  //    children: [
                  //      const Text(
                  //        'اضافة',
                  //        style:  TextStyle(
                  //          fontSize: 16.0,
                  //        ),
                  //        textAlign: TextAlign.end,
                  //
                  //      ),
                  //     // SizedBox(width: 10,),
                  //
                  //      Radio(
                  //       value: 1,
                  //       groupValue: _radioValue,
                  //       onChanged: handleRadioValueChange,
                  // ),
                  //    ],
                  //  ),
                  //  Row(
                  //    mainAxisAlignment: MainAxisAlignment.end,
                  //    crossAxisAlignment: CrossAxisAlignment.center,
                  //    children: [
                  //      const Text(
                  //        'توسيع شعبة',
                  //        style:  TextStyle(fontSize: 16.0),
                  //        textAlign: TextAlign.end,
                  //
                  //      ),
                  //      Radio(
                  //       value: 2,
                  //       groupValue: _radioValue,
                  //       onChanged: handleRadioValueChange,
                  // ),
                  //    ],
                  //  ),
                  Text(
                    'ادخل الرقم الجامعي *',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 45,
                      margin: const EdgeInsets.only(top: 10, bottom: 25),
                      padding: const EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextFormField(
                        controller: _idController,
                        autocorrect: true,
                        maxLines: 1,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.length < 10) {
                            return " الرقم قصير ";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          icon: Icon(
                            Icons.drive_file_rename_outline,
                            color: Color(0xff027e82),
                          ),
                          hintText: 'رقم الطالب',
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'ادخل الاسم *',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 45,
                      margin: const EdgeInsets.only(top: 10, bottom: 25),
                      padding: const EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextFormField(
                        controller: _nameController,
                        autocorrect: true,
                        maxLines: 1,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.length < 5) {
                            return " الاسم كامل ";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          icon: Icon(
                            Icons.drive_file_rename_outline,
                            color: Color(0xff027e82),
                          ),
                          hintText: 'اسم الطالب',
                        ),
                      ),
                    ),
                  ),

                  Text(
                    'اختيار نوع الطلب *',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ButtonTheme(
                    alignedDropdown: true,
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      width: 90,
                      child: DropdownButton(
                        // Initial Value
                        value: dropdownvalue,
                        iconDisabledColor: Colors.red,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),
                        // Array list of items
                        items: itemsType.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'تخصص الجامعي *',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 90,
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton(
                        // Initial Value
                        value: dropdownvalue2,
                        iconDisabledColor: Colors.red,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),
                        // Array list of items
                        items: itemsUniversityMajor.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue2 = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'اختار المساق *',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 150,
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton(
                        // Initial Value
                        value: dropdownvalue3,
                        iconDisabledColor: Colors.red,
                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),
                        // Array list of items
                        items: coursename.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue3 = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        DataBaseServices(
                          _nameController.text,
                          _idController.text,
                          dropdownvalue.toString(),
                          dropdownvalue2.toString(),
                          dropdownvalue3.toString(),
                        )
                            .addStudent()
                            .then(
                              (value) => ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('تم ارسال الطلب'),
                                backgroundColor: Colors.green,
                              )),
                            )
                            .catchError((onError) =>
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('حدث خطا'),
                                  backgroundColor: Colors.red,
                                )));
                      }

                      _idController.clear();
                      _nameController.clear();
                    },
                    child: Center(
                      child: Container(
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                            color: const Color(0xff027e82),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: const Text(
                            'ارسال طلب',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
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

class ReturnNumber extends StatefulWidget {
  const ReturnNumber({Key? key}) : super(key: key);

  @override
  State<ReturnNumber> createState() => _ReturnNumberState();
}

class _ReturnNumberState extends State<ReturnNumber> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'الرقم المرجعي',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff027e82),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 3,
                  color: Colors.white,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.9,
                  height: 45,
                  margin: EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(
                      top: 4, left: 16, right: 16, bottom: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 8)
                    ],
                  ),
                  child: TextFormField(
                    controller: _numberController,
                    autocorrect: true,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(0, 4, 0, 8),
                      // suffix:Icon(Icons.arrow_drop_down,
                      //   color: Color(0xff0e86c4),
                      // ) ,
                      suffixIcon: Icon(Icons.arrow_drop_down,
                          color: Color(0xff0e86c4), size: 28),
                      hintText: '01254825',
                    ),
                  ),
                ),
                InkWell(
                  // onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 40,
                    width: 80,
                    margin: EdgeInsets.only(top: 15, bottom: 10),
                    decoration: BoxDecoration(
                        color: const Color(0xff17c7ad),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      'بحث',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        color: const Color(0xff17c7ad),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      'رجوع',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
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
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['حذف', 'اضافة', 'تعديل']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
