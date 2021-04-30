import 'package:flutter/material.dart';
import 'package:kipos_app/models/post_model.dart';
import 'package:kipos_app/services/post_services.dart';
import 'package:kipos_app/views/post_detail.dart';

class PostView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Blog"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 3),
          child: FutureBuilder<List<Post>>(
            future: PostServices.getUsersLocally(context),
            builder: (context, product) {
              final posts = product.data;

              switch (product.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  if (product.hasError) {
                    return Center(child: Text('Hata'));
                  } else {
                    return buildPosts(posts);
                  }
              }
            },
          ),
        ),
      );

  Widget buildPosts(List<Post> posts) => ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 3.0, color: Colors.grey),
              ),
            ),
            child: ListTile(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => PostPage(post: post),
                ),
              ),
              title: Text(
                post.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(post.date),
              leading: Image.network(
                post.imgurl,
              ),
            ),
          );
        },
      );
}
