List questions_list = [];

void selectQuestion(Map<String, dynamic> ques) {
  questions_list.add(ques);
}

List get getquestionList => questions_list;