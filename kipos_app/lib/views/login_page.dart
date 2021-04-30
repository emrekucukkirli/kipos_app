import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kipos_app/views/register.dart';
import 'package:kipos_app/views/survey.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String mail = '';
  String pasword = '';

  void kontrol() {
    if ((mail.length > 10) && (pasword.length == 8)) {
      var data = [];
      data.add(mail);
      data.add(pasword);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SurveyPage(pasword, mail),
          settings: RouteSettings(
            arguments: data,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool buttonPasif = true;
    if ((mail.length > 10) && (pasword.length == 8)) {
      buttonPasif = false;
    } else {
      buttonPasif = true;
    }
    void _mailKaydet(String text) {
      setState(() {
        mail = text;
      });
    }

    void _pasworddKaydet(String text) {
      setState(() {
        pasword = text;
      });
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.red,
        ),
        elevation: 0,
        title: Text(
          "Giriş Yap",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Image.asset(
                    "assets/images/ig_logo.png",
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Mail Adresiniz",
                    icon: Icon(Icons.mail),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (text) {
                    _mailKaydet(text);
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Şifre",
                    icon: Icon(Icons.lock),
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    _pasworddKaydet(text);
                  },
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: buttonPasif ? null : kontrol,
                    child: Text(
                      'Giriş',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).accentColor),
                      shape: MaterialStateProperty.all(StadiumBorder()),
                      fixedSize: MaterialStateProperty.all(
                        Size.fromWidth(250),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text(
                      "Hâlâ Üye olmadın mı",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).hintColor),
                      shape: MaterialStateProperty.all(StadiumBorder()),
                      fixedSize: MaterialStateProperty.all(
                        Size.fromWidth(250),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
