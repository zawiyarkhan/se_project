// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:se_pro/Controllers/api_calls.dart';
import 'package:se_pro/Controllers/get_question_list.dart';
import 'package:se_pro/Controllers/question_list.dart';
import 'package:se_pro/models/question_model.dart';
import 'package:se_pro/models/quizModel.dart';


class ChooseQuestion extends StatefulWidget {
  String name;
  String instructor;
  String questionsNo;
  String time;
  String code;
  ChooseQuestion({
    super.key,
    required this.name,
    required this.instructor,
    required this.questionsNo,
    required this.time,
    required this.code,
  });

  @override
  State<ChooseQuestion> createState() => _ChooseQuestionState();
}

class _ChooseQuestionState extends State<ChooseQuestion> {
  final List<String> items = [
    "Python",
    "Operating System",
    "DatabaseManagement",
    "Java",
  ];
  List<QuestionModel> questions = [];
  String? selectedValue = "Python";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final lst = Provider.of<QuestionsList>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Row(
                      children: const [
                        Icon(
                          Icons.list,
                          size: 16,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            'Select Item',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 14,
                    iconEnabledColor: Colors.black,
                    iconDisabledColor: Colors.grey,
                    buttonHeight: 50,
                    buttonWidth: 200,
                    buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black26, width: 2),
                      color: Colors.white,
                    ),
                    buttonElevation: 1,
                    itemHeight: 40,
                    itemPadding: const EdgeInsets.only(left: 14, right: 14),
                    dropdownMaxHeight: 200,
                    dropdownWidth: 200,
                    dropdownPadding: null,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    dropdownElevation: 4,
                    scrollbarRadius: const Radius.circular(40),
                    scrollbarThickness: 6,
                    scrollbarAlwaysShow: true,
                    offset: const Offset(-0, 0),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Please tap on the Questions that you want to add",
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  )),
              SizedBox(
                height: 30,
              ),
              StreamBuilder<List<QuestionModel>>(
                stream: readQuestionData(selectedValue),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                  }
                  if (snapshot.hasData) {
                    final DocData = snapshot.data;

                    return Expanded(
                      child: ListView.builder(
                        itemCount: DocData!.length,
                        itemBuilder: (context, index) {
                          var question = DocData[index];
                          //var options = DocData[index].choices;

                          var quest = question.toJson();
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: ChangeNotifierProvider<QuestionsList>(
                              create: (context) => QuestionsList(),
                              child: Builder(
                                builder: (context) {
                                  return Consumer<QuestionsList>(
                                    builder: (context, provider, child) {
                                      return GestureDetector(
                                        onTap: () {
                                          provider.Tapped();
                                          selectQuestion(quest);
                                          provider.addQuesiton(quest);
                                          //print(getquestionList);
                                          ;
                                        },
                                        onDoubleTapCancel: () {
                                          provider.Tapped();
                                          provider.removeQuestion();
                                        },
                                        child: Card(
                                          elevation: 2,
                                          child: Container(
                                            padding: EdgeInsets.all(15),
                                            //height: height / 10,
                                            width: width / 2,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 3,
                                                  color: provider.getTapped
                                                      ? Colors.greenAccent
                                                      : Colors.black,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.white),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 6.0),
                                                  child: Text(
                                                    question.question,
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() async {
            final quiz = QuizModel(
              quizName: widget.name,
              quizCode: widget.code,
              instructorName: widget.instructor,
              time: widget.time,
              totalQuestions: widget.questionsNo,
              questions: getquestionList,
            );
            print(getquestionList);
            bool create = await quiz.createQuiz();
          }),
          //isExtended: true,
          backgroundColor: Colors.black,
          child: Icon(
            // Icons.arrow_right_alt_outlined,
            Icons.thumb_up_alt,
            size: 25,
          ),
        ),
      ),
    );
  }
}