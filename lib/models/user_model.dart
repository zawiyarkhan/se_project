import 'package:cloud_firestore/cloud_firestore.dart';

class UserQ {
  var name;
  var id;
  var profilePic;
  var quizAttempted;

  UserQ({
    this.name,
    this.id,
    this.profilePic,
    this.quizAttempted,
  });

  Future<bool> createUser() async {
    var collection = await FirebaseFirestore.instance
        .collection('Users')
        .doc(id)
        .set(toJson());

    return true;
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id, //.map((i) => i.toMap()).toList(),
        'profilePic': profilePic,
        'quizAttempted': quizAttempted,
      };

  static UserQ fromJson(Map<String, dynamic> json) {
    return UserQ(
      name: json['name'],
      id: json['id'],
      profilePic: json['profilePic'],
      quizAttempted: json['quizAttempted'],
    );
  }
}