import 'package:cloud_firestore/cloud_firestore.dart';

class QuizModel {
  var quizCode;
  var questions;
  var time;
  var totalQuestions;
  var quizName;
  var instructorName;

  QuizModel({
    this.quizCode,
    this.questions,
    this.instructorName,
    this.quizName,
    this.time,
    this.totalQuestions,
  });

  Future<bool> createQuiz() async {
    var collection = await FirebaseFirestore.instance
        .collection('Quizes')
        .doc(quizCode.toUpperCase())
        .set(toJson());

    return true;
  }

  Map<String, dynamic> toJson() => {
        'quizCode': quizCode,
        'questions': questions, //.map((i) => i.toMap()).toList(),
        'time': time,
        'totalQuestions': totalQuestions,
        'quizName': quizName,
        'instructorName': instructorName,
      };

  static QuizModel fromJson(Map<String, dynamic> json) {
    return QuizModel(
      quizCode: json['quizCode'],
      questions: json['questions'],
      instructorName: json['instructorName'],
      time: json['time'],
      totalQuestions: json['totalQuestions'],
      quizName: json['quizName'],
    );
  }
}