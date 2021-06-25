import 'package:flutter/material.dart';
import 'package:kipos_app/models/tea_brew_model.dart';

import 'drawer_widget.dart';

class TeaBrewPage extends StatelessWidget {
  final TeaBrew teabrew;

  const TeaBrewPage({
    Key key,
    @required this.teabrew,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(teabrew.title),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        drawer: KiposDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image(
                image: NetworkImage(teabrew.imgurl),
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Title(
                  color: Colors.red,
                  child: Text(
                    teabrew.title,
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
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Detaylar",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        teabrew.body,
                        style: TextStyle(
                          fontSize: 20,
                        ),
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
