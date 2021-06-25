import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  String id;
  String question;

  Question({this.id, this.question});

  factory Question.fromSnapshot(DocumentSnapshot snapshot) {
    return Question(
      id: snapshot.id,
      question: snapshot["question"],
    );
  }
}
