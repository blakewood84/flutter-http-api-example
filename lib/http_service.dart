import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_request/post_model.dart';

class HttpService {
  var url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> getPosts() async {
    var res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();

      return posts;
    } else {
      throw "Can't get posts";
    }
  }
}
