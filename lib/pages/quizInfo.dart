// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se_pro/Controllers/generate_code.dart';

import 'package:se_pro/pages/choose_question.dart';

class QuizInfo extends StatefulWidget {
  const QuizInfo({super.key});

  @override
  State<QuizInfo> createState() => _QuizInfoState();
}

class _QuizInfoState extends State<QuizInfo> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _instructorController = TextEditingController();
  TextEditingController _questionsController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  String code = "";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GenerateCodeProvider>(
      create: (context) => GenerateCodeProvider(),
      child: Builder(
        builder: (context) {
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Quixlet",
                        style: GoogleFonts.satisfy(
                          fontSize: 45,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person_outline),
                        hintText: "Give your quiz a name",
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _instructorController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.developer_board),
                        hintText: "Instructor Name",
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Total Questions",
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Container(
                            width: 150,
                            child: TextFormField(
                              controller: _questionsController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.numbers),
                                hintText: "Number",
                                hintStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Time",
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Container(
                            width: 150,
                            child: TextFormField(
                              controller: _timeController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.timer_outlined),
                                hintText: "Minutes",
                                hintStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          // Text(
                          //   "Minutes",
                          //   style: GoogleFonts.roboto(
                          //     fontSize: 20,
                          //     fontWeight: FontWeight.w400,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Generate a six digit unique code",
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Consumer<GenerateCodeProvider>(
                        builder: (context, provider, child) {
                          return Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  provider.generteCode();
                                  //String code = provider.getCode;
                                  //print(code);
                                  code = provider.getCode;
                                },
                                backgroundColor: Colors.black,
                                child: Icon(
                                  Icons.circle,
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              Container(
                                width: 200,
                                height: 60,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    provider.getCode.toUpperCase(),
                                    style: GoogleFonts.roboto(
                                      color: Colors.grey,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              ),
                              // Text(
                              //   "Minutes",
                              //   style: GoogleFonts.roboto(
                              //     fontSize: 20,
                              //     fontWeight: FontWeight.w400,
                              //   ),
                              // ),
                            ],
                          );
                        },
                      ),
                    ),
                    Spacer(flex: 1),
                    Padding(
                      padding: const EdgeInsets.only(left: 80, bottom: 14.0),
                      child: Text(
                        "Add Questions",
                        style: GoogleFonts.roboto(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: (() {
                  Get.to(() => ChooseQuestion(
                        name: _nameController.text,
                        instructor: _instructorController.text,
                        questionsNo: _questionsController.text,
                        time: _timeController.text,
                        code: code,
                      ));
                }),
                //isExtended: true,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.arrow_right_alt_outlined,
                  size: 40,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}