import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kipos_app/models/questions_model.dart';

class QuestionService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Soru eklemek için
  Future<void> addQuestion(String question) async {
    var ref = _firestore.collection("Question");

    var documentRef = await ref.add({'question': question});

    return Question(id: documentRef.id, question: question);
  }

  //Soru göstermek için
  Stream<QuerySnapshot> getQuestion() {
    var ref = _firestore.collection("Question").snapshots();

    return ref;
  }

  //Soru silmek için
  Future<void> removeQuestion(String docId) {
    var ref = _firestore.collection("Question").doc(docId).delete();

    return ref;
  }
}
