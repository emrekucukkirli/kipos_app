import 'package:flutter/material.dart';
import 'package:kipos_app/models/vlog_model.dart';
import 'package:kipos_app/views/vlog_detail.dart';
import 'package:kipos_app/services/vlog_services.dart';

import 'drawer_widget.dart';

class VlogView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Vlog"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        drawer: KiposDrawer(),
        body: Padding(
          padding: const EdgeInsets.only(top: 3),
          child: FutureBuilder<List<Vlog>>(
            future: VlogServices.getUsersLocally(context),
            builder: (context, product) {
              final vlogs = product.data;

              switch (product.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  if (product.hasError) {
                    return Center(child: Text('Hata'));
                  } else {
                    return buildPosts(vlogs);
                  }
              }
            },
          ),
        ),
      );

  Widget buildPosts(List<Vlog> vlogs) => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: vlogs.length,
        itemBuilder: (context, index) {
          final vlog = vlogs[index];
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 3.0, color: Colors.grey),
              ),
            ),
            child: ListTile(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => VlogPage(vlog: vlog),
                ),
              ),
              leading: Icon(Icons.video_collection),
              title: Text(
                vlog.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: Text(vlog.date),
            ),
          );
        },
      );
}
