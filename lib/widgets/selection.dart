// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SelectionCard extends StatefulWidget {
  String text;
  Widget Function() page;
  SelectionCard({super.key, required this.text, required this.page});

  @override
  State<SelectionCard> createState() => _SelectionCardState();
}

class _SelectionCardState extends State<SelectionCard> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Material(
        child: InkWell(
          onTap: () {
            Get.to(() => widget.page());
          },
          child: Container(
            height: 150,
            width: width,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(20)),
              elevation: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.text,
                      style: GoogleFonts.asap(
                          fontSize: 20, fontWeight: FontWeight.w700))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}