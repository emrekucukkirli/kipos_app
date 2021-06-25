import 'package:flutter/material.dart';
import 'package:kipos_app/models/vlog_model.dart';
import 'package:kipos_app/services/video_services.dart';
import 'package:video_player/video_player.dart';

import 'drawer_widget.dart';

class VlogPage extends StatelessWidget {
  final Vlog vlog;

  const VlogPage({
    Key key,
    @required this.vlog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(vlog.title),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      drawer: KiposDrawer(),
      body: ListView(
        children: [
          VideoServices(
            videoPlayerController: VideoPlayerController.network(
              vlog.videourl,
            ),
            looping: true,
            autoplay: true,
          ),
        ],
      ),
    );
  }
}
