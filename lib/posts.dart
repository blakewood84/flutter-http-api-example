import 'package:flutter/material.dart';
import 'package:http_request/http_service.dart';

import 'post_model.dart';

class PostsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: FutureBuilder(
          future: httpService.getPosts(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasData) {
              List<Post> posts = snapshot.data;

              return ListView(
                  children: posts.map((Post post) => Text(post.title)).toList());
            }
            return Center(child: CircularProgressIndicator());
          },
      ),
    );
  }
}
