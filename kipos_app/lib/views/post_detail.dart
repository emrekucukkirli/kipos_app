import 'package:flutter/material.dart';
import 'package:kipos_app/models/post_model.dart';

class PostPage extends StatelessWidget {
  final Post post;

  const PostPage({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(post.title),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image(
                image: NetworkImage(post.imgurl),
                width: MediaQuery.of(context).size.width * 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Title(
                  color: Colors.red,
                  child: Text(
                    post.title,
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
                    ListTile(
                      leading: Text(
                        post.writer,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        post.date,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(18),
                      child: Text(
                        post.body,
                        style: TextStyle(fontSize: 18),
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
