import 'package:flutter/material.dart';
import 'package:kipos_app/models/tea_brew_model.dart';
import 'package:kipos_app/services/tea_brew_services.dart';
import 'package:kipos_app/views/tea_brew_detail.dart';

class TeaBrewView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<List<TeaBrew>>(
          future: TeaBrewServices.getUsersLocally(context),
          builder: (context, product) {
            final teabrews = product.data;

            switch (product.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (product.hasError) {
                  return Center(child: Text('Hata'));
                } else {
                  return buildTeaBrews(teabrews);
                }
            }
          },
        ),
      );

  Widget buildTeaBrews(List<TeaBrew> teabrews) => GridView.builder(
        // padding: EdgeInsets.all(4.0),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 5.7 / 6,
          crossAxisSpacing: 10,
          mainAxisSpacing: 0,
        ),
        physics: BouncingScrollPhysics(),
        itemCount: teabrews.length,
        itemBuilder: (context, index) {
          final teabrew = teabrews[index];
          return Container(
            alignment: Alignment.bottomLeft,
            child: ListTile(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      TeaBrewPage(teabrew: teabrew),
                ),
              ),
              leading: Text(
                teabrew.title,
                softWrap: true,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(image: NetworkImage(teabrew.imgurl)),
            ),
          );
        },
      );
}
