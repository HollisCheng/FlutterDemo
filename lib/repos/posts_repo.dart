import 'package:flutter_app/models/posts.dart';
import 'package:http/http.dart' as http;

class PostsRepository {
  Future<List<Post>> getPosts() async {
    final response =
        await http.get("https://jsonplaceholder.typicode.com/posts");
    return postFromJson(response.body);
  }
}
