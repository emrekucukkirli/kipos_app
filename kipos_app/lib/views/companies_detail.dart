import 'package:flutter/material.dart';
import 'package:kipos_app/models/companies_model.dart';

import 'drawer_widget.dart';

class CompaniesPage extends StatelessWidget {
  final Company company;

  const CompaniesPage({
    Key key,
    @required this.company,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(company.name),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        drawer: KiposDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Title(
                  color: Colors.red,
                  child: Text(
                    company.name,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        company.about,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        "Uzmanlık Alanı",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        company.profession,
                        style: TextStyle(fontSize: 20),
                      ),
                      tileColor: Colors.red[100],
                    ),
                    ListTile(
                      leading: Text(
                        "İndirim",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        company.discount,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        "Şehir",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        company.city,
                        style: TextStyle(fontSize: 20),
                      ),
                      tileColor: Colors.red[100],
                    ),
                    ListTile(
                      leading: Text(
                        "İnstagram",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        company.instagram,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
