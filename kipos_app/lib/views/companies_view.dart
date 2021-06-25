import 'package:flutter/material.dart';
import 'package:kipos_app/models/companies_model.dart';
import 'package:kipos_app/services/companies_services.dart';

import 'companies_detail.dart';
import 'drawer_widget.dart';

class CompaniesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Anlaşmalı Firmalar"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        drawer: KiposDrawer(),
        body: Padding(
          padding: const EdgeInsets.only(top: 3),
          child: FutureBuilder<List<Company>>(
            future: CompaniesServices.getUsersLocally(context),
            builder: (context, product) {
              final companies = product.data;

              switch (product.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  if (product.hasError) {
                    return Center(child: Text('Hata'));
                  } else {
                    return buildPosts(companies);
                  }
              }
            },
          ),
        ),
      );

  Widget buildPosts(List<Company> companies) => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: companies.length,
        itemBuilder: (context, index) {
          final company = companies[index];
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2.0, color: Colors.red),
              ),
            ),
            child: ListTile(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      CompaniesPage(company: company),
                ),
              ),
              leading: Text(
                company.id.toString(),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              title: Text(
                company.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(company.profession),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            ),
          );
        },
      );
}
