// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:se_pro/Controllers/question_list.dart';

class ChooseQuesitonCard extends StatefulWidget {
  String question;
  Map options;
  ChooseQuesitonCard(
      {super.key, required this.question, required this.options});

  @override
  State<ChooseQuesitonCard> createState() => _ChooseQuesitonCardState();
}

class _ChooseQuesitonCardState extends State<ChooseQuesitonCard> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ChangeNotifierProvider<QuestionsList>(
        create: (context) => QuestionsList(),
        child: Builder(
          builder: (context) {
            return Consumer<QuestionsList>(
              builder: (context, provider, child) {
                return GestureDetector(
                  onTap: () {
                    provider.Tapped();
                    //provider.addQuesiton(widget.question, widget.options);
                    // var lst = provider.getList;
                    // print(lst.length);
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
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Text(
                              widget.question,
                              style: GoogleFonts.roboto(
                                  fontSize: 19, fontWeight: FontWeight.normal),
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
  }
}
