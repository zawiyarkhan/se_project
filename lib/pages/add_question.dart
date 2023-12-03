import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddQuestions extends StatefulWidget {
  String name;
  String instructor;
  String questionsNo;
  String time;
  String code;
  AddQuestions({
    super.key,
    required this.name,
    required this.instructor,
    required this.questionsNo,
    required this.time,
    required this.code,
  });

  @override
  State<AddQuestions> createState() => _AddQuestionsState();
}

class _AddQuestionsState extends State<AddQuestions> {
  TextEditingController Question_controller = TextEditingController();
  TextEditingController _option1_controller = TextEditingController();
  TextEditingController _option2_controller = TextEditingController();
  TextEditingController _option3_controller = TextEditingController();
  TextEditingController _option4_controller = TextEditingController();
  int? _value = 0;
  String boolean = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Question:",
                style: GoogleFonts.roboto(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: Question_controller,
                obscureText: true,
                decoration: InputDecoration(
                  //prefixIcon: const Icon(Icons.password),
                  //labelText: "Password",
                  labelStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Options:",
                style: GoogleFonts.roboto(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Please check the correct answer",
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: _option1_controller,
                      obscureText: true,
                      decoration: InputDecoration(
                        //prefixIcon: const Icon(Icons.password),
                        labelText: "Password",
                        labelStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Radio(
                    value: 0,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                        boolean = "true";
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: _option2_controller,
                      obscureText: true,
                      decoration: InputDecoration(
                        //prefixIcon: const Icon(Icons.password),
                        labelText: "Password",
                        labelStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Radio(
                    value: 1,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: _option3_controller,
                      obscureText: true,
                      decoration: InputDecoration(
                        //prefixIcon: const Icon(Icons.password),
                        labelText: "Password",
                        labelStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Radio(
                    value: 2,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: _option4_controller,
                      obscureText: true,
                      decoration: InputDecoration(
                        //prefixIcon: const Icon(Icons.password),
                        labelText: "Password",
                        labelStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Radio(
                    value: 3,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                        print(_value);
                      });
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}