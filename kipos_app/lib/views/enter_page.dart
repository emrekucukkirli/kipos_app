import 'package:flutter/material.dart';
import 'package:kipos_app/views/register.dart';

import 'login_page.dart';

class EnterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: Image.asset("assets/images/ig_logo.png"),
              ),
            ),
            Spacer(),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    "KIPOS APP",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(
                      Icons.login,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                      // Navigator.pushNamed(context, '/login');
                    },
                    label: Text(
                      "Giriş Yap",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).accentColor),
                      shape: MaterialStateProperty.all(StadiumBorder()),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(
                      Icons.app_registration,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                      // Navigator.pushNamed(context, '/login');
                    },
                    label: Text(
                      "Üye Ol",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).accentColor),
                      shape: MaterialStateProperty.all(StadiumBorder()),
                    ),
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
