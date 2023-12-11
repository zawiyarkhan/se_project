// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se_pro/pages/quiz_room.dart';

class QuizJoining extends StatefulWidget {
  const QuizJoining({super.key});

  @override
  State<QuizJoining> createState() => _QuizJoiningState();
}

class _QuizJoiningState extends State<QuizJoining> {
  var controller = TextEditingController();

  var list;
  final QuizData = FirebaseFirestore.instance.collection("Quizes");

  getData(String code) {
    QuizData.doc(code).get().then((DocumentSnapshot doc) {
      list = doc.data();
      print("what");
      print(list['questions'][0]['choices'].keys.toList());
    });
  }

  // void getData(String code) async {
  //   var collection = FirebaseFirestore.instance.collection('Quizes');
  //   var docSnapshot = await collection.doc(code).get();
  //   if (docSnapshot.exists) {
  //     Map<String, dynamic>? data = docSnapshot.data();
  //     list_question = data?['questions'];

  //     print(list_question); // <-- The value you want to retrieve.
  //     // Call setState if needed.
  //     //list_question = value;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   foregroundColor: ,
        // ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Enter the 6 Digit Dode to Enter the Quiz Room",
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                      //prefixIcon: const Icon(Icons.one_x_mobiledata),
                      hintText: "XXXXXX",
                      hintStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 30.0),
              //   child: Center(
              //     child: OutlinedButton(
              //       onPressed: () async {
              //         // final user = User(name: _nameField.text, email: _emailField.text, contact: _contactField.text);
              //         // bool create = await user.createUser();
              //         // if (create){
              //         //   Get.to(()=>const Home());
              //         // }
              //         Get.to(() => QuizRoom());
              //       },
              //       style: OutlinedButton.styleFrom(
              //           primary: const Color(0xFF030303),
              //           fixedSize: Size(width, 40),
              //           //fixedSize: const Size(100,100),
              //           side: BorderSide(width: 1.3, color: Colors.black),
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(10))),
              //       child: const Text(
              //         "Join",
              //         style:
              //             TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        //floatingActionButtonLocation: ,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("object");
            getData(controller.text);
            print("tihs");
            print(list);
            Fluttertoast.showToast(
                msg: "Your Quiz is loading",
                fontSize: 18,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM);
            Future.delayed(Duration(seconds: 4), () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => QuizRoom(
                            list_question: list,
                          )));
            });
          },
          elevation: 3.0,
          child: Icon(Icons.arrow_right_alt_outlined, size: 40),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}