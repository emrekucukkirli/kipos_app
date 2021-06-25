import 'package:flutter/material.dart';
import 'package:kipos_app/views/question_list_view.dart';

import 'add_questions_view.dart';
import 'drawer_widget.dart';

class QuestionsView extends StatefulWidget {
  @override
  _QuestionsViewState createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sorular"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      drawer: KiposDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddQuestionPage()));
        },
        child: Icon(Icons.add),
      ),
      body: QuestionListPage(),
    );
  }
}
