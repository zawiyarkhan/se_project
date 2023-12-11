// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se_pro/Controllers/question_controller.dart';
import 'package:se_pro/widgets/choice_widget.dart';

import 'package:se_pro/widgets/result_box.dart';

//var list_question;

class QuizRoom extends StatefulWidget {
  //String code;
  var list_question;
  QuizRoom({super.key, required this.list_question});

  @override
  State<QuizRoom> createState() => _QuizRoomState();
}

class _QuizRoomState extends State<QuizRoom> {
  int index = 0;

  bool isPressed = false;
  int score = 0;
  bool isAlreadySelected = false;

  void nextQuestion() {
    if (index == 6) {
      showDialog(
          context: context,
          builder: ((context) => ResultBox(
                score: score,
              )));
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      }
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   print("hi");
  //   getData();
  //   print("hello");
  //   print(list_question['questions'][0]['choices'].keys.toList());
  // }

  // getData() {
  //   QuizData.doc(widget.code).get().then((DocumentSnapshot doc) {
  //     list_question = doc.data();
  //     print(list_question['questions'][0]['choices'].keys.toList());
  //   });
  // }

  void Tapped(String value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == "true") {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.circular(50)),
                child: GetBuilder<QuestionController>(
                    init: QuestionController(),
                    builder: (controller) {
                      return Stack(children: [
                        LayoutBuilder(
                            builder: (context, constraints) => Container(
                                  width: constraints.maxWidth *
                                      controller.animation.value,
                                  decoration: BoxDecoration(
                                    color: Color(0xff253c6e),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                )),
                        Positioned.fill(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${(controller.animation.value * 30).round()} secs',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17,
                                      color: Colors.white),
                                ),
                                Icon(
                                  Icons.timer,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        )
                      ]);
                    }),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  widget.list_question['questions'][index]['question'],
                  style: GoogleFonts.roboto(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              for (int i = 0; i < 4; i++)
                GestureDetector(
                  onTap: () => Tapped(widget
                      .list_question['questions'][index]['choices'].values
                      .toList()[i]),
                  child: Choice(
                    option: widget
                        .list_question['questions'][index]['choices'].keys
                        .toList()[i],
                    color: isPressed
                        ? widget.list_question['questions'][index]['choices']
                                    .values
                                    .toList()[i] ==
                                "true"
                            ? Colors.greenAccent
                            : Colors.redAccent
                        : Colors.grey.withOpacity(0.1),
                  ),
                ),
              SizedBox(
                height: 20,
              ),
              Spacer(
                flex: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () async {
                      // final user = User(name: _nameField.text, email: _emailField.text, contact: _contactField.text);
                      // bool create = await user.createUser();
                      // if (create){
                      //   Get.to(()=>const Home());
                      // }
                      //Get.to(() => MainNavigation());
                    },
                    style: OutlinedButton.styleFrom(
                        primary: const Color(0xFF030303),
                        fixedSize: Size(150, 40),
                        //fixedSize: const Size(100,100),
                        side: BorderSide(width: 1.3, color: Colors.black),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      "Previous",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: nextQuestion,
                    style: OutlinedButton.styleFrom(
                        primary: const Color(0xFF030303),
                        fixedSize: Size(150, 40),
                        //fixedSize: const Size(100,100),
                        side: BorderSide(width: 1.3, color: Colors.black),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      "Next",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}