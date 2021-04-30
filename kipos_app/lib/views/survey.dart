import 'package:flutter/material.dart';
import 'package:kipos_app/controllers/survey_voter.dart';
import 'package:polls/polls.dart';

import 'home_page.dart';

class SurveyPage extends StatefulWidget {
  String mail = '';
  String pasword = '';
  SurveyPage(String pasword, String mail);

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  double secenek1 = 1.0;
  double secenek2 = 1.0;
  double secenek3 = 1.0;
  double secenek4 = 1.0;

  String admin = "admin@gmail.com";

  @override
  Widget build(BuildContext context) {
    var data = [];
    data = ModalRoute.of(context).settings.arguments;
    var mail = data[0];
    var pasword = data[1];

    return Scaffold(
      appBar: AppBar(
        title: Text("Ekipman Anketi"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Polls(
              children: [
                Polls.options(title: 'V 60', value: secenek1),
                Polls.options(title: 'Chemex', value: secenek2),
                Polls.options(title: 'Kalita', value: secenek3),
                Polls.options(title: 'Aeropress', value: secenek4),
              ],
              question: Text(
                "Hoşgeldiniz " + data[0] + "\nFavori ekipmanınız hangisi?",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              voteData: surveyVoter,
              currentUser: data[0],
              creatorID: this.admin,
              userChoice: surveyVoter[data[0]],
              onVoteBackgroundColor: Colors.cyan,
              leadingBackgroundColor: Colors.cyan,
              backgroundColor: Colors.white,
              onVote: (secim) {
                print(secim);
                setState(() {
                  surveyVoter[data[0]] = secim;
                });

                if (secim == 1) {
                  setState(() {
                    secenek1 += 1;
                  });
                } else if (secim == 2) {
                  setState(() {
                    secenek2 += 1;
                  });
                } else if (secim == 3) {
                  setState(() {
                    secenek3 += 1;
                  });
                } else if (secim == 4) {
                  setState(() {
                    secenek4 += 1;
                  });
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 1,
                  child: ElevatedButton.icon(
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    label: Text(
                      'Anasayfaya Git',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).errorColor)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => homePage()),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
