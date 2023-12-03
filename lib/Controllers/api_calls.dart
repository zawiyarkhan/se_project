import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:se_pro/models/question_model.dart';

Stream<List<QuestionModel>> readQuestionData(String? value) =>
    FirebaseFirestore.instance.collection(value as String).snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => QuestionModel.fromJson(doc.data()))
            .toList());
