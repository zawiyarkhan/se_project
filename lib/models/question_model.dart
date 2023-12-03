class QuestionModel {
  var question;
  var choices;

  QuestionModel({
    this.question,
    this.choices,
  });

  static QuestionModel fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      question: json['question'],
      choices: json['options'],
    );
  }

  Map<String, dynamic> toJson() => {
        'question': question,
        'choices': choices,
      };
}